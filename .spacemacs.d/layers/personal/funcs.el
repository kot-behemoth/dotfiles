;; SQL setup
(setq sql-connection-alist
      '((local (sql-product 'postgres)
                  (sql-server "localhost")
                  (sql-user "appearhere")
                  (sql-password "appearhere")
                  (sql-database "appearhere_development"))
        (sca-wh (sql-product 'postgres)
            (sql-server "datawarehouse.cvfgrn2lzdlx.ap-southeast-2.redshift.amazonaws.com")
            (sql-user "awsuser")
            (sql-port 5439)
            (sql-database "datawarehouse"))
      ))

(defun postgres-dev ()
  (interactive)
  (sql-connect-favourite 'postgres 'local))

(defun redshift-sca-wh ()
  (interactive)
  (sql-connect-favourite 'postgres 'sca-wh))

(defun sql-connect-favourite (product connection)
  ;; remember to set the sql-product, otherwise, it will fail for the first time
  ;; you call the function
  (setq sql-product product)
  (sql-connect connection))

(defvar my-sql-servers-list
  '(
    ("Warehouse" redshift-sca-wh)
    ("Local" postgres-dev)
    )
  "Alist of server name and the function to connect")

(defun my-sql-connect-server (func)
  "Connect to the input server using my-sql-servers-list"
  (interactive
    (helm-comp-read "Select server: " my-sql-servers-list))
  (funcall func))

(defun run-cmdexe (promp-id)
  (interactive
    (cond
    ((equal current-prefix-arg nil)     ; universal-argument not called
      (list
      (generate-new-buffer-name "*cmd.exe*")))

    ((equal current-prefix-arg '(4))    ; C-u
      (let ((prompt-name (read-string "Prompt name: " nil)))
        (list (concat "*cmd.exe-" prompt-name "*")))
      )))

  (let ((shell-file-name "cmd.exe")
        (explicit-shell-file-name "cmd.exe"))
    (shell promp-id)))
