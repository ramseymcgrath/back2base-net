# worker/services.py
import os
import requests
import time

def fetch_outlook_calendar(api_token: str):
    """
    Example function to fetch Outlook calendar events.
    Replace the endpoint and logic to suit your actual API.
    """
    # Placeholder URL for Outlook's graph API (One endpoint could be https://graph.microsoft.com/v1.0/me/events)
    outlook_api_url = "https://graph.microsoft.com/v1.0/me/calendarview"

    headers = {
        "Authorization": f"Bearer {api_token}",
        "Content-Type": "application/json"
    }

    # Example params to define time range or other filters
    params = {
        "startDateTime": "2025-01-14T00:00:00Z",
        "endDateTime": "2025-01-15T23:59:59Z"
    }

    response = requests.get(outlook_api_url, headers=headers, params=params)
    
    if response.status_code == 200:
        events = response.json().get('value', [])
        return events
    else:
        print(f"Failed to fetch Outlook data: {response.text}")
        return []


def fetch_jira_issues(api_token: str, domain: str):
    """
    Example function to fetch Jira issues.
    domain could be something like 'yourcompany.atlassian.net'
    """
    jira_api_url = f"https://{domain}/rest/api/3/search"
    
    headers = {
        "Authorization": f"Bearer {api_token}",
        "Accept": "application/json"
    }

    # Example JQL query, adjust as needed
    data = {
        "jql": "project = TEST ORDER BY created DESC",
        "maxResults": 10
    }

    response = requests.post(jira_api_url, headers=headers, json=data)
    
    if response.status_code == 200:
        issues = response.json().get("issues", [])
        return issues
    else:
        print(f"Failed to fetch Jira issues: {response.text}")
        return []


def sync_schedules_with_db(outlook_events, jira_issues):
    """
    Placeholder function to sync or store data in a DB (e.g. Postgres).
    """
    # TODO: Insert or update data in your DB
    print("Syncing data to DB...")
    print(f"Outlook events fetched: {len(outlook_events)}")
    print(f"Jira issues fetched: {len(jira_issues)}")
    # e.g., db_client.upsert(events), db_client.upsert(issues)
    # For now, just printing
    pass
