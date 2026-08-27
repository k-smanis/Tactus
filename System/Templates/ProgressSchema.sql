-- Progress.sqlite schema
-- Schema version: 4
-- Consumers must enable foreign_keys on every SQLite connection.

PRAGMA foreign_keys = ON;

BEGIN;

CREATE TABLE phases (
    id           INTEGER PRIMARY KEY,
    title        TEXT NOT NULL CHECK (length(trim(title)) > 0),
    description  TEXT,
    status       TEXT NOT NULL DEFAULT 'pending'
                 CHECK (status IN ('pending', 'active', 'blocked', 'completed', 'cancelled')),
    sort_order   INTEGER NOT NULL DEFAULT 0 CHECK (sort_order >= 0),
    created_at   TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
    updated_at   TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
    completed_at TEXT
);

CREATE TABLE initiatives (
    id           INTEGER PRIMARY KEY,
    phase_id     INTEGER NOT NULL REFERENCES phases(id) ON DELETE RESTRICT,
    title        TEXT NOT NULL CHECK (length(trim(title)) > 0),
    description  TEXT,
    status       TEXT NOT NULL DEFAULT 'pending'
                 CHECK (status IN ('pending', 'active', 'blocked', 'completed', 'cancelled')),
    sort_order   INTEGER NOT NULL DEFAULT 0 CHECK (sort_order >= 0),
    created_at   TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
    updated_at   TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
    completed_at TEXT
);

CREATE TABLE tasks (
    id           INTEGER PRIMARY KEY,
    initiative_id INTEGER NOT NULL REFERENCES initiatives(id) ON DELETE RESTRICT,
    title        TEXT NOT NULL CHECK (length(trim(title)) > 0),
    description  TEXT,
    status       TEXT NOT NULL DEFAULT 'pending'
                 CHECK (status IN ('pending', 'active', 'blocked', 'completed', 'cancelled')),
    sort_order   INTEGER NOT NULL DEFAULT 0 CHECK (sort_order >= 0),
    created_at   TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
    updated_at   TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
    completed_at TEXT
);

CREATE TABLE task_files (
    task_id INTEGER NOT NULL REFERENCES tasks(id) ON DELETE CASCADE,
    path    TEXT NOT NULL CHECK (length(trim(path)) > 0),
    reason  TEXT CHECK (reason IS NULL OR length(trim(reason)) > 0),
    PRIMARY KEY (task_id, path)
);

CREATE TABLE events (
    id          INTEGER PRIMARY KEY,
    event_type  TEXT NOT NULL CHECK (length(trim(event_type)) > 0),
    summary     TEXT NOT NULL CHECK (length(trim(summary)) > 0),
    details     TEXT,
    phase_id    INTEGER REFERENCES phases(id) ON DELETE SET NULL,
    initiative_id INTEGER REFERENCES initiatives(id) ON DELETE SET NULL,
    task_id     INTEGER REFERENCES tasks(id) ON DELETE SET NULL,
    occurred_at TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
    CHECK (
        (phase_id IS NOT NULL) +
        (initiative_id IS NOT NULL) +
        (task_id IS NOT NULL) <= 1
    )
);

CREATE INDEX idx_phases_status_order
    ON phases(status, sort_order, id);

CREATE INDEX idx_initiatives_phase_order
    ON initiatives(phase_id, sort_order, id);

CREATE INDEX idx_initiatives_status_order
    ON initiatives(status, sort_order, id);

CREATE INDEX idx_tasks_initiative_order
    ON tasks(initiative_id, sort_order, id);

CREATE INDEX idx_tasks_status_order
    ON tasks(status, sort_order, id);

CREATE INDEX idx_events_occurred_at
    ON events(occurred_at DESC, id DESC);

CREATE INDEX idx_events_phase
    ON events(phase_id, occurred_at DESC);

CREATE INDEX idx_events_initiative
    ON events(initiative_id, occurred_at DESC);

CREATE INDEX idx_events_task
    ON events(task_id, occurred_at DESC);

PRAGMA user_version = 4;

COMMIT;
