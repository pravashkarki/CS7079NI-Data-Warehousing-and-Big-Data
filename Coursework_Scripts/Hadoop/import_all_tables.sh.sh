
# Deleting all table files from HDFS to avoid error

hdfs dfs -rm -r -skipTrash /user/hduser/orders
hdfs dfs -rm -r -skipTrash /user/hduser/order_items
hdfs dfs -rm -r -skipTrash /user/hduser/categories
hdfs dfs -rm -r -skipTrash /user/hduser/departments
hdfs dfs -rm -r -skipTrash /user/hduser/customers
hdfs dfs -rm -r -skipTrash /user/hduser/products

# Sqoop command to import all table at once in Hive staging database named as staging_retail

sqoop import-all-tables --connect jdbc:mysql://localhost/retail_db \
--username root \
--password root \
--create-hive-table \
--hive-import \
--hive-database staging_retail \
-m 1 \
--direct
