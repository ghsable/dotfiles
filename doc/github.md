git init ~ git push :

    git init
    git git remote add origin <URL>
    git add --all
    git commit -m "first commit"
    git push -u origin master

git add ~ git push :

    git add --all
    git commit -m "COMMENT"
    git push -u origin master

git add 取り消し :

    git reset

現在いるレポジトリのトップディレクトリの絶対パスを返す :

    git rev-parse --show-toplevel

削除したファイル(file)の復旧 :

    git branch --contains=HEAD         # 現在のブランチを確認
    git log --diff-filter=D --summary  # 削除履歴の有るコミットIDを確認
    git checkout <commit>              # 目的のブランチへ移動
    cp -r <file> ~/                    # 削除したファイルを一時退避
    git checkout master                # 元のブランチへ移動
