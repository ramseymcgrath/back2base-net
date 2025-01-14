# worker/main.py

import os
import time
from services import fetch_outlook_calendar, fetch_jira_issues, sync_schedules_with_db

def run_worker():
    """
    Continuously runs tasks to fetch data from external services and sync them to a DB.
    In a real setup, you might want to use something like Celery + Redis,
    or a scheduling tool like cron/airflow instead of a while loop.
    """
    # Load tokens or credentials from environment variables
    outlook_token = os.getenv("OUTLOOK_API_TOKEN", "<your_outlook_token>")
    jira_token = os.getenv("JIRA_API_TOKEN", "<your_jira_token>")
    jira_domain = os.getenv("JIRA_DOMAIN", "yourcompany.atlassian.net")

    # Run tasks in a loop
    while True:
        print("Worker cycle started...")
        
        # 1. Fetch from Outlook
        outlook_events = fetch_outlook_calendar(outlook_token)

        # 2. Fetch from Jira
        jira_issues = fetch_jira_issues(jira_token, jira_domain)

        # 3. Sync or store the fetched data
        sync_schedules_with_db(outlook_events, jira_issues)

        print("Worker cycle completed. Sleeping for 60 seconds...")
        time.sleep(60)  # Sleep 1 minute between cycles (tweak to your needs)

if __name__ == "__main__":
    run_worker()
