# Airflow ETL/ELT Orchestration Application

This repository contains an ETL/ELT orchestration application built using Apache Airflow. The application is configured with Airflow webserver, scheduler, Celery worker, and Celery Flower for task execution and monitoring.

## Features

- Airflow Webserver: Provides a user interface for managing and monitoring workflows.
- Airflow Scheduler: Schedules and triggers workflows based on predefined DAG (Directed Acyclic Graph) configurations.
- Celery Worker: Executes tasks asynchronously using Celery distributed task queue.
- Celery Flower: Provides real-time monitoring and visualization of Celery tasks.

## Prerequisites

- Docker
- Python 3.x
- Apache Airflow

## Getting Started

1. Clone this repository:

``` git clone https://github.com/your-username/your-repo.git ```

2. Navigate to the project directory:

3. Set AIRFLOW_HOME environment variable.

4. Start Airflow Webserver, Scheduler, Celery Worker, and Celery Flower using the following commands:

``` airflow init db ```
``` airflow scheduler ```
``` airflow webserver ```
``` airflow celery worker ```
``` airflow celery flower ```
. 
5. Access the Airflow UI at `http://localhost:8080` to manage and monitor your workflows.

6. Access the Celery Flower dashboard at `http://localhost:5555` to monitor Celery tasks.

## Directory Structure

- `docker-compose.yml`: Docker Compose configuration for the Airflow application.
- `.env`: Environment variables file containing configuration settings.
- `dags/`: Directory containing Airflow DAG files.
- `plugins/`: Directory for Airflow custom plugins.
- `requirements.txt`: Python dependencies file.

## Usage

- Define your ETL/ELT workflows as directed acyclic graphs (DAGs) in the `dags/` directory.
- Customize and extend Airflow functionality using custom plugins in the `plugins/` directory.
- Monitor task execution and troubleshoot issues using the Airflow webserver and Celery Flower.

## Credits

This Airflow application was created by Syed Muneeb Hussain.
