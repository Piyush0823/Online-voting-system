import os
import json
import hashlib
import mysql.connector as connector

DEFAULT_CONFIG = {
    "host": "127.0.0.1",
    "port": 3306,
    "user": "root",
    "password": "root123",
    "database": "voting_system"
}

def load_db_config():
    """Loads database config from config.json and optional environment variables."""
    config_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "config.json")
    config = DEFAULT_CONFIG.copy()

    if os.path.exists(config_path):
        try:
            with open(config_path, "r", encoding="utf-8") as f:
                file_config = json.load(f)
                for key, val in file_config.items():
                    if key in DEFAULT_CONFIG:
                        config[key] = val
        except Exception:
            pass

    env_map = {
        "host": "DB_HOST",
        "port": "DB_PORT",
        "user": "DB_USER",
        "password": "DB_PASSWORD",
        "database": "DB_NAME"
    }

    for key, env_name in env_map.items():
        value = os.getenv(env_name)
        if value is not None and value != "":
            config[key] = int(value) if key == "port" else value

    return config
