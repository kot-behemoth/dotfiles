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
