## TODOアプリ機能追加アイデア

### はじめに

このドキュメントは、インターン生がTODOアプリの改修や機能追加を行う際のアイデアリストです。難易度も考慮して分類していますので、学習の進捗に合わせて挑戦してみてください。

---

### 1. 基本的な機能改善（難易度：低〜中）

*   **タスクのバリデーション:**
    *   タスクのタイトルが空のままでは登録できないようにする。
    *   **実装例:**
        1.  **モデルにバリデーションを追加:**
            ```ruby
            # app/models/task.rb
            class Task < ApplicationRecord
              validates :title, presence: true
            end
            ```
        2.  **コントローラで保存失敗時の処理を実装:**
            ```ruby
            # app/controllers/tasks_controller.rb
            def create
              @task = Task.new(task_params)
              if @task.save
                redirect_to tasks_url, notice: "タスクを登録しました。"
              else
                # status: :unprocessable_entity をつけると、Turboが適切に処理してくれる
                render :new, status: :unprocessable_entity
              end
            end
            ```
        3.  **ビューでエラーメッセージを表示:**
            ```erb
            <!-- app/views/tasks/_form.html.erb -->
            <%= form_with(model: task) do |form| %>
              <% if task.errors.any? %>
                <div style="color: red;">
                  <h2><%= task.errors.count %>件のエラーがあります:</h2>
                  <ul>
                    <% task.errors.full_messages.each do |message| %>
                      <li><%= message %></li>
                    <% end %>
                  </ul>
                </div>
              <% end %>
              ...
            <% end %>
            ```

*   **タスクの完了状態の更新（非同期通信なし）:**
    *   一覧画面のチェックボックスをクリックするだけで、タスクの完了/未完了を切り替えられるようにする。
    *   **実装例:**
        1.  **ルーティングの追加:** `member`ブロックを使って、特定のタスクに対するアクションのルーティングを追加します。
            ```ruby
            # config/routes.rb
            resources :tasks do
              member do
                patch :toggle_completion
              end
            end
            ```
        2.  **ビューのチェックボックスをフォームに変更:** チェックボックスの変更を検知して、フォームを自動で送信するようにします。
            ```erb
            <!-- app/views/tasks/_task.html.erb -->
            <%= form_with(model: task, url: toggle_completion_task_path(task), method: :patch) do |form| %>
              <%= form.check_box :completed, onchange: 'this.form.submit()', class: 'form-check-input' %>
              <span class="<%= 'text-decoration-line-through' if task.completed? %>">
                <%= task.title %>
              </span>
            <% end %>
            ```
        3.  **コントローラにアクションを追加:**
            ```ruby
            # app/controllers/tasks_controller.rb
            # before_action :set_task, only: [..., :toggle_completion] を忘れずに

            def toggle_completion
              @task.update(completed: !@task.completed)
              redirect_to tasks_url, notice: "タスクの状態を更新しました。"
            end
            ```

*   **タスクの並び替え:**
    *   タスクを登録日順（新しい順/古い順）、タイトル順（昇順/降順）などで一覧を並び替えられるようにする。
    *   **実装例:**
        1.  **ビューに並び替えリンクを設置:**
            ```erb
            <!-- app/views/tasks/index.html.erb -->
            <div class="mb-3">
              <span>並び替え:</span>
              <%= link_to "登録日(新しい順)", tasks_path(sort: "created_at_desc"), class: "btn btn-sm btn-outline-secondary" %>
              <%= link_to "登録日(古い順)", tasks_path(sort: "created_at_asc"), class: "btn btn-sm btn-outline-secondary" %>
              <%= link_to "タイトル(昇順)", tasks_path(sort: "title_asc"), class: "btn btn-sm btn-outline-secondary" %>
            </div>
            ```
        2.  **コントローラでパラメータに応じて並び替え:**
            ```ruby
            # app/controllers/tasks_controller.rb
            def index
              @tasks = case params[:sort]
                       when "created_at_desc"
                         Task.order(created_at: :desc)
                       when "created_at_asc"
                         Task.order(created_at: :asc)
                       when "title_asc"
                         Task.order(title: :asc)
                       else
                         Task.all # デフォルト
                       end
            end
            ```

*   **タスクの検索/絞り込み:**
    *   キーワード検索や、完了/未完了でタスクを絞り込めるようにする。
    *   **実装例:**
        1.  **ビューに検索フォームを設置:**
            ```erb
            <!-- app/views/tasks/index.html.erb -->
            <%= form_with(url: tasks_path, method: :get, class: "mb-3") do |form| %>
              <div class="input-group">
                <%= form.text_field :keyword, value: params[:keyword], placeholder: "キーワード検索", class: "form-control" %>
                <%= form.select :status, options_for_select([["すべて", "all"], ["未完了", "incomplete"], ["完了", "completed"]], params[:status]), {}, { class: "form-select" } %>
                <%= form.submit "検索", class: "btn btn-primary" %>
              </div>
            <% end %>
            ```
        2.  **コントローラでパラメータに応じて絞り込み:**
            ```ruby
            # app/controllers/tasks_controller.rb
            def index
              @tasks = Task.all
              if params[:keyword].present?
                # 簡単なLIKE検索の例
                @tasks = @tasks.where("title LIKE ?", "%#{Task.sanitize_sql_like(params[:keyword])}%")
              end
              if params[:status] == "incomplete"
                @tasks = @tasks.where(completed: false)
              elsif params[:status] == "completed"
                @tasks = @tasks.where(completed: true)
              end
              # 上記の並び替え機能と組み合わせることも可能
            end
            ```

*   **通知機能（簡易版）:**
    *   タスクの期限が近づいたら、画面上部にメッセージを表示する（期限設定機能と組み合わせると良い）。
    *   **ヒント:** まずは`Task`モデルに`deadline`（日付型）カラムを追加するマイグレーションを作成します。その後、一覧表示の際に`deadline`が近い（例: 3日以内）タスクを抽出し、ビューで特別なメッセージを表示します。

---

### 1.5. 軽微な修正・改善案（難易度：低）

*   **ルートページをタスク一覧に変更:**
    *   毎回 `/tasks` にアクセスする手間を省きます。
    *   **実装例:**
        ```ruby
        # config/routes.rb
        Rails.application.routes.draw do
          root "tasks#index"
          resources :tasks
          # ...
        end
        ```

*   **完了したタスクに取り消し線を引く:**
    *   視覚的に完了状態を分かりやすくします。
    *   **実装例:** Bootstrap 5 を利用している場合
        ```erb
        <!-- app/views/tasks/_task.html.erb -->
        <span class="<%= 'text-decoration-line-through' if task.completed? %>">
          <%= task.title %>
        </span>
        ```

*   **日本語化の改善:**
    *   モデル名や属性名、フラッシュメッセージなどを日本語で表示します。
    *   **実装例:**
        ```yaml
        # config/locales/ja.yml
        ja:
          activerecord:
            models:
              task: タスク
            attributes:
              task:
                title: タイトル
                completed: 完了状態
          tasks:
            create:
              notice: "タスクを登録しました。"
            update:
              notice: "タスクを更新しました。"
            destroy:
              notice: "タスクを削除しました。"
        ```

*   **詳細ページや一覧ページに日時を表示:**
    *   タスクがいつ作成・更新されたかを表示します。
    *   **実装例:**
        ```erb
        <!-- app/views/tasks/show.html.erb -->
        <p>
          <strong>作成日時:</strong>
          <%= l @task.created_at, format: :long %>
        </p>
        <p>
          <strong>更新日時:</strong>
          <%= l @task.updated_at, format: :long %>
        </p>
        ```
        **ヒント:** `l` ヘルパー（`localize`のエイリアス）を使うと、`config/locales`の設定に応じたフォーマットで日時を表示できます。`ja.yml`にフォーマットを追加してみましょう。
        ```yaml
        # config/locales/ja.yml
        ja:
          time:
            formats:
              default: "%Y/%m/%d %H:%M:%S"
              long: "%Y年%m月%d日(%a) %H時%M分"
              short: "%m/%d %H:%M"
        ```

---

### 2. ユーザー体験の向上（難易度：中）

*   **非同期通信（Ajax）の導入:**
    *   **タスクの完了状態更新:** チェックボックスをクリックした際に、ページ全体を再読み込みせずに、タスクの状態だけを更新する。
    *   **タスクの新規作成/編集/削除:** ページ遷移なしで、フォームの送信や削除を行う。
    *   **ヒント:** RailsのHotwire（Turbo Frames, Turbo Streams）やStimulusを学ぶ良い機会です。

*   **フラッシュメッセージの強化:**
    *   成功/失敗メッセージ（`notice`, `alert`）を、BootstrapのToastコンポーネントなどを使って、より分かりやすく、デザイン性のあるものにする。

*   **ページネーション:**
    *   タスクが多数になった場合に、ページを分割して表示する（例: 1ページあたり10件表示）。
    *   **ヒント:** `kaminari`や`will_paginate`といったgemの導入を検討。

---

### 3. 新しい機能の追加（難易度：中〜高）

*   **ユーザー管理機能:**
    *   複数のユーザーがそれぞれ自分のTODOリストを持てるようにする。
    *   ユーザー登録、ログイン、ログアウト機能。
    *   **ヒント:** `devise` gemの導入を検討。

*   **タスクのカテゴリ分け:**
    *   タスクに「仕事」「プライベート」「買い物」などのカテゴリを設定できるようにする。
    *   カテゴリごとにタスクを絞り込んだり、表示したりする。
    *   **ヒント:** `Category`モデルを作成し、`Task`モデルと関連付ける。

*   **期限設定:**
    *   各タスクに期限（日付、時刻）を設定できるようにする。
    *   期限が近いタスクを一覧で強調表示したり、期限切れのタスクを区別して表示する。

*   **コメント機能:**
    *   各タスクに対して、複数のコメントを追加できるようにする。
    *   **ヒント:** `Comment`モデルを作成し、`Task`モデルと関連付ける。

*   **ファイル添付機能:**
    *   タスクに画像やドキュメントなどのファイルを添付できるようにする。
    *   **ヒント:** RailsのActive Storage機能を利用。

---

### 4. 技術的な挑戦（難易度：高）

*   **APIの作成:**
    *   TODOアプリのデータを外部のアプリケーションから操作できるRESTful APIを作成する。
    *   **ヒント:** `rails new`時に`--api`オプションを付けたプロジェクトの構造を参考にしたり、`jbuilder`を使ってJSONレスポンスを整形したりする。

*   **テストの導入:**
    *   作成した各機能に対して、自動テスト（ユニットテスト、システムテストなど）を記述する。
    *   **ヒント:** Railsのテストフレームワーク（Minitest）や、RSpecといった外部のテストフレームワークを学ぶ。

*   **デプロイ:**
    *   作成したアプリをHerokuやRender、AWSなどのクラウドサービスにデプロイし、インターネット上に公開する。
    *   **ヒント:** `kamal` gemやDocker、Capistranoといったデプロイツールを学ぶ。

---

これらのアイデアが、あなたの学習と開発の助けとなれば幸いです。
