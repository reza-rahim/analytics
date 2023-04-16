from airflow import DAG
from datetime import datetime
from airflow.operators.bash import BashOperator


with DAG(dag_id="01.spark",
         start_date=datetime(2021,1,1),
         schedule_interval="@hourly",
         catchup=False) as dag:

     task1 = BashOperator(
         task_id="01.spark.1",
         bash_command='export SPARK_HOME=/opt/spark; ${SPARK_HOME}/bin/spark-submit  --class org.apache.spark.examples.SparkPi --master spark://node-1:7077,node-2:7077  $SPARK_HOME/examples/jars/spark-examples_2.13-3.3.2.jar')
