-- ==============================
-- 1. users
-- ==============================
CREATE TABLE users (
    id                  SERIAL PRIMARY KEY,
    username            VARCHAR(100) NOT NULL UNIQUE,
    email               VARCHAR(255) NOT NULL UNIQUE,
    outlook_user_id     VARCHAR(255),
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- ==============================
-- 2. teams
-- ==============================
CREATE TABLE teams (
    id              SERIAL PRIMARY KEY,
    name            VARCHAR(255) NOT NULL UNIQUE,
    description     TEXT,
    created_at      TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- ==============================
-- 3. team_memberships
-- Many-to-many join table for users <-> teams
-- ==============================
CREATE TABLE team_memberships (
    id          SERIAL PRIMARY KEY,
    team_id     INT NOT NULL,
    user_id     INT NOT NULL,
    created_at  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_team
        FOREIGN KEY (team_id) 
        REFERENCES teams (id)
        ON DELETE CASCADE,
        
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users (id)
        ON DELETE CASCADE
);

-- ==============================
-- 4. office_schedules
-- Tracks if a user is in office or remote on a specific date
-- ==============================
CREATE TABLE office_schedules (
    id              SERIAL PRIMARY KEY,
    user_id         INT NOT NULL,
    schedule_date   DATE NOT NULL,
    is_in_office    BOOLEAN NOT NULL DEFAULT FALSE,
    notes           TEXT,
    created_at      TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_office_user
        FOREIGN KEY (user_id)
        REFERENCES users (id)
        ON DELETE CASCADE
);

-- Optional index for faster queries by (user_id, schedule_date)
CREATE INDEX idx_office_schedules_user_date
    ON office_schedules (user_id, schedule_date);

-- ==============================
-- 5. outlook_events
-- Stores relevant Outlook events for each user (if you choose to persist them)
-- ==============================
CREATE TABLE outlook_events (
    id                  SERIAL PRIMARY KEY,
    user_id             INT NOT NULL,
    outlook_event_id    VARCHAR(255) NOT NULL,
    subject             VARCHAR(255),
    start_time          TIMESTAMP WITH TIME ZONE,
    end_time            TIMESTAMP WITH TIME ZONE,
    location            VARCHAR(255),
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_outlook_user
        FOREIGN KEY (user_id)
        REFERENCES users (id)
        ON DELETE CASCADE
);

-- Optionally ensure (user_id, outlook_event_id) is unique if each user-event combo must be unique
CREATE UNIQUE INDEX ux_outlook_events_user_event_id
    ON outlook_events (user_id, outlook_event_id);

-- ==============================
-- 6. jira_issues
-- Stores basic info about Jira issues
-- ==============================
CREATE TABLE jira_issues (
    id              SERIAL PRIMARY KEY,
    issue_key       VARCHAR(50) NOT NULL,  -- e.g., "PROJ-123"
    summary         VARCHAR(255),
    description     TEXT,
    status          VARCHAR(50),
    reporter_id     INT,                  -- Optionally link to 'users' table
    assignee_id     INT,                  -- Optionally link to 'users' table
    created_at      TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_jira_reporter
        FOREIGN KEY (reporter_id)
        REFERENCES users (id)
        ON DELETE SET NULL,
        
    CONSTRAINT fk_jira_assignee
        FOREIGN KEY (assignee_id)
        REFERENCES users (id)
        ON DELETE SET NULL
);

-- Optionally ensure issue_key is unique (depends on your usage)
CREATE UNIQUE INDEX ux_jira_issues_key
    ON jira_issues (issue_key);
