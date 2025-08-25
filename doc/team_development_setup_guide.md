# GitHub Organizationを使ったチーム開発環境セットアップガイド

## はじめに
> ゴールは、会社（あなた）が管理する箱（Organization）の中に、各チーム専用の開発部屋（リポジトリ）を用意し、そこにチームメンバー（インターン生）を招待することです。

このドキュメントは、GitHub Organizationを活用して、インターン生などのチームが開発をスムーズに開始できるようにするためのセットアップ手順を解説します。

---

## ステップ1: Organizationを作成する

まず、チームやプロジェクトの器となるOrganizationを作成します。

1.  GitHubにログインし、画面右上の「**+**」アイコンをクリックし、「**New organization**」を選択します。
2.  プラン選択画面が表示されるので、「**Free**」プランの「Create a free organization」をクリックします。（無料プランで十分な機能が使えます）
3.  **Organization account name:** URLなどにも使われる組織名を決めます。（例: `my-company-intern`）
4.  **Contact email:** 連絡用のメールアドレスを入力します。
5.  `This organization belongs to:` は「My personal account」のままで大丈夫です。
6.  指示に従って認証を済ませると、メンバー招待画面になりますが、ここは一旦「**Skip this step**」でOKです。

✅ これで、あなたのOrganizationが作成されました。

---

## ステップ2: TODOアプリを「テンプレートリポジトリ」として準備する

次に、各チームに複製して渡す元となる「テンプレート」を準備します。

1.  **リポジトリの移管:**
    1.  現在のTODOアプリのリポジトリページを開きます。
    2.  「**Settings**」タブ > 「**General**」の一番下にある「**Transfer ownership**」セクションを見つけます。
    3.  「**Transfer**」ボタンを押し、指示に従って、リポジトリの所有者をステップ1で作成したあなたのOrganizationに変更します。
        > **Note:** この方法が、コミット履歴などを維持したまま移行できるので最も簡単です。
2.  **テンプレート化:**
    1.  リポジトリがOrganizationに移動したら、その**リポジトリ個別の**「**Settings**」タブ > 「**General**」ページを開きます。
    2.  「Features」セクションの中にある「**Template repository**」という項目にチェックを入れます。

✅ これで、誰でもこのリポジトリを雛形として新しいリポジトリを作成できるようになりました。

---

## ステップ3: メンバーを招待し、「チーム」を作成する

Organizationにインターン生を招待し、管理しやすくするために「チーム」にまとめます。

1.  Organizationのトップページ（`github.com/あなたのOrganization名`）にアクセスします。
2.  「**People**」タブをクリックし、「**Invite member**」ボタンでインターン生のGitHubユーザー名またはメールアドレスを入力して招待します。
3.  次に、「**Teams**」タブをクリックし、「**New team**」ボタンで開発チームを作成します。（例: `team-alpha`, `developers`）
4.  作成したチームのページで「**Members**」タブを開き、招待したインターン生をチームに追加します。

---

## ステップ4: チーム専用の開発リポジトリを作成・割り当て

テンプレートを使って、各チームが実際に開発を行うリポジトリを作成します。

1.  ステップ2でテンプレート化したリポジトリ（`todo_app`）のページを開きます。
2.  緑色の「**Use this template**」ボタンをクリックし、「**Create a new repository**」を選択します。
3.  **Owner:** あなたのOrganizationを選択します。
4.  **Repository name:** チーム用のリポジトリ名を決めます。（例: `team-alpha-todo-project`）
5.  **Visibility:** `Private`（非公開）を推奨します。
6.  「**Create repository**」ボタンを押して作成します。
7.  新しく作成されたリポジトリ（`team-alpha-todo-project`）の「**Settings**」タブ > 「**Collaborators and teams**」に移動します。
8.  「**Add teams**」ボタンを押し、ステップ3で作成したチーム（`team-alpha`）を検索して追加します。
9.  権限レベルを聞かれるので、「**Write**」を選択します。
    > **Note:** これにより、チームメンバーはブランチのプッシュやプルリクエストの作成ができますが、リポジトリの設定変更などの危険な操作はできなくなります。

---

## 開発開始！ インターン生が行うこと

以上の準備が完了したら、インターン生には以下のように案内してください。

1.  GitHubから届いているOrganizationへの招待を承認します。
2.  自分に割り当てられたチームのリポジトリ（例: `team-alpha-todo-project`）にアクセスします。
3.  そのリポジトリのページで「**Code**」ボタンから **GitHub Codespacesを起動**し、開発をスタートします！
