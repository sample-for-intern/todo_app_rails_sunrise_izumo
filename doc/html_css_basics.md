## HTMLとCSSの基礎

### はじめに

Webページは、主にHTMLとCSSという2つの言語で構成されています。HTMLがページの「骨格」や「構造」を作り、CSSがその「見た目」や「装飾」を定義します。このドキュメントでは、それぞれの基本的な役割と、今回のTODOアプリでどのように使われているかを解説します。

---

### 1. HTMLとは？

HTML（HyperText Markup Language）は、Webページのコンテンツ（テキスト、画像、リンクなど）の意味と構造を定義するためのマークアップ言語です。Webページの「骨格」や「設計図」のようなものです。

*   **タグの概念:** HTMLは「タグ」と呼ばれる記号を使って要素を定義します。タグは通常、開始タグ（`<p>`）と終了タグ（`</p>`）で構成され、その間にコンテンツを記述します。
    *   `<h1>`から`<h6>`: 見出し
    *   `<p>`: 段落
    *   `<div>`: コンテンツをグループ化するための汎用的なブロック要素
    *   `<a>`: リンク
    *   `<img>`: 画像
    *   `<table>`, `<thead>`, `<tbody>`, `<tr>`, `<th>`, `<td>`: 表
    *   `<form>`, `<input>`, `<label>`, `<button>`: フォーム要素

*   **要素と属性:**
    *   **要素:** 開始タグから終了タグまでを含めた全体を指します（例: `<p>これは段落です</p>`）。
    *   **属性:** タグに追加情報を与えるものです。開始タグの中に`属性名="値"`の形式で記述します（例: `<a href="https://example.com">リンク</a>`）。
        *   `class`: CSSを適用するためのクラス名（複数指定可能）
        *   `id`: 要素を一意に識別するためのID（ページ内で一つだけ）
        *   `style`: 直接CSSを記述（インラインスタイル）

*   **基本的なHTMLドキュメントの構造:**
    ```html
    <!DOCTYPE html>
    <html>
    <head>
      <title>ページのタイトル</title>
      <!-- ここにCSSの読み込みなど、ページに関する情報を記述 -->
    </head>
    <body>
      <!-- ここにユーザーに見せるコンテンツを記述 -->
      <h1>こんにちは！</h1>
      <p>これはWebページです。</p>
    </body>
    </html>
    ```
    *   `<head>`: ページに関する情報（タイトル、CSSの読み込み、JavaScriptの読み込みなど）を記述します。ブラウザには表示されません。
    *   `<body>`: 実際にユーザーに見せるコンテンツ（テキスト、画像、ボタンなど）を記述します。

---

### 2. CSSとは？

CSS（Cascading Style Sheets）は、HTMLで作成されたWebページの見た目（色、フォント、レイアウト、サイズなど）を装飾するためのスタイルシート言語です。Webページの「化粧」や「服装」のようなものです。

*   **セレクタ、プロパティ、値:**
    *   **セレクタ:** どのHTML要素にスタイルを適用するかを指定します（例: `h1`, `p`, `.my-class`, `#my-id`）。
    *   **プロパティ:** 変更したい見た目の種類を指定します（例: `color`, `font-size`, `background-color`, `margin`, `padding`）。
    *   **値:** プロパティに設定する具体的な値です（例: `red`, `20px`, `#f0f0f0`）。

    ```css
    h1 { /* h1要素に適用 */
      color: blue; /* 文字色を青に */
      font-size: 32px; /* フォントサイズを32pxに */
    }

    .my-class { /* class="my-class"を持つ要素に適用 */
      background-color: lightgray;
      padding: 10px;
    }
    ```

*   **CSSの適用方法:**
    1.  **インラインスタイル:** HTMLタグの`style`属性に直接記述します（例: `<p style="color: red;">赤い文字</p>`）。最も優先度が高いですが、管理が大変なため限定的に使われます。
    2.  **内部スタイルシート:** HTMLファイルの`<head>`タグ内に`<style>`タグを使って記述します。そのHTMLファイル内でのみ有効です。
    3.  **外部スタイルシート:** 独立した`.css`ファイルを作成し、HTMLからリンクして読み込みます。最も一般的で推奨される方法です。今回のTODOアプリもこの方法です。

----- 

### 3. HTMLとCSSの連携

HTML要素にCSSを適用するには、主に`class`属性や`id`属性を使います。

*   **`class`属性:** 複数の要素に同じスタイルを適用したい場合に便利です。CSSでは`.クラス名`で指定します。
*   **`id`属性:** ページ内でただ一つの要素にスタイルを適用したい場合に便利です。CSSでは`#ID名`で指定します。

```html
<h1 class="main-title">ようこそ</h1>
<p id="intro-text">これは紹介文です。</p>
```

```css
.main-title {
  color: green;
  text-align: center;
}

#intro-text {
  font-style: italic;
}
```

---

### 4. Bootstrapについて

Bootstrapは、HTML、CSS、JavaScriptのフレームワークであり、Webサイトを素早く、そして美しく、レスポンシブに（様々な画面サイズに対応して）デザインするためのツールキットです。

*   **CSSフレームワーク:** あらかじめデザインされたCSSクラスが豊富に用意されており、それらをHTML要素に適用するだけで、プロフェッショナルな見た目を実現できます。
*   **レスポンシブデザイン:** スマートフォン、タブレット、PCなど、様々なデバイスの画面サイズに合わせてレイアウトが自動的に調整されます。
*   **主要なコンポーネント:**
    *   `container`: コンテンツの幅を制限し、中央に配置するための基本的なコンポーネント。
    *   `btn`, `btn-primary`, `btn-danger`: ボタンのスタイル。
    *   `table`, `table-bordered`, `table-striped`: 表のスタイル。
    *   `card`, `card-body`: コンテンツをまとめるカード形式のコンポーネント。
    *   `form-control`, `form-check-input`: フォーム要素のスタイル。
*   **ユーティリティクラス:**
    *   `mb-3`: `margin-bottom: 1rem`（下方向に余白）
    *   `me-2`: `margin-right: 0.5rem`（右方向に余白）
    *   `d-flex`: `display: flex`（Flexboxレイアウトを適用）
    *   `justify-content-between`: Flexアイテムを両端に配置
    *   `align-items-center`: Flexアイテムを垂直方向の中央に配置
    *   `text-center`: テキストを中央揃え
    *   `shadow-sm`: 小さな影を追加
    *   `rounded-3`: 角を丸くする

---

### 5. 今回のTODOアプリでのHTML/CSS

このTODOアプリでは、RailsのERBテンプレート内でHTMLを記述し、Bootstrapのクラスを積極的に利用してデザインしています。

*   **`app/views/layouts/application.html.erb`:**
    *   Webページの基本的なHTML構造（`<html>`, `<head>`, `<body>`）を定義しています。
    *   BootstrapのCSSをCDNから読み込むための`<link>`タグが記述されています。
    *   `main-container`クラスが`<body>`に適用され、コンテンツを画面中央に配置しています。

*   **`app/views/tasks/index.html.erb`:**
    *   タスクの一覧を表示するメインのHTMLです。
    *   `container`, `table`, `table-bordered`, `table-striped`などのBootstrapクラスを使って、表形式のレイアウトを作成しています。
    *   `d-flex`, `justify-content-between`, `align-items-center`で、見出しとボタンの配置を調整しています。

*   **`app/views/tasks/_task.html.erb`:**
    *   各タスクの行（`<tr>`）のHTML構造を定義する部分テンプレートです。
    *   `text-decoration-line-through`, `text-muted`などのクラスで、完了したタスクの見た目を変更しています。
    *   `btn-group`, `btn`, `btn-sm`, `btn-outline-secondary`, `btn-primary`, `btn-danger`などのクラスで、操作ボタンをスタイリングしています。

*   **`app/views/tasks/_form.html.erb`:**
    *   タスクの新規作成・編集フォームのHTML構造を定義する部分テンプレートです。
    *   `card`, `card-body`, `form-label`, `form-control`, `form-check-input`, `form-check-label`, `d-grid`などのBootstrapクラスを使って、フォームを見やすく整えています。

*   **`app/assets/stylesheets/application.bootstrap.scss`:**
    *   アプリケーション独自のカスタムCSSを記述するファイルです。
    *   `body`の背景色や、`#tasks .task-item:last-child hr`のように、特定の要素のスタイルを調整するために使われています。

---

### 6. 簡単な練習問題

以下の問題を解いて、HTMLとCSSの理解を深めてみましょう。

#### 問題1: HTMLタグの利用

以下のテキストをHTMLで記述してください。

*   「私の好きな食べ物」という一番大きな見出し
*   その下に「りんご」「バナナ」「みかん」という箇条書きリスト

#### 問題2: CSSの適用

問題1で作成したHTMLの「りんご」の文字色を赤色に、フォントサイズを20pxにしてください。

#### 問題3: Bootstrapクラスの利用

以下のHTMLのボタンに、Bootstrapのクラスを使って「青色の塗りつぶしボタン」と「緑色の枠線だけのボタン」を適用してください。

```html
<button>ボタン1</button>
<button>ボタン2</button>
```

---

このドキュメントが、あなたのWeb開発学習の一助となれば幸いです。
