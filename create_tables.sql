-- Create DIM_time dimension table
CREATE TABLE DIM_time(
    time_id INT IDENTITY PRIMARY KEY,
    day INT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL
)

-- Create DIM_player dimension table
CREATE TABLE DIM_player(
    player_id INT IDENTITY PRIMARY KEY,
    url NVARCHAR(500) NOT NULL,
    short_name NVARCHAR(100) NOT NULL,
    long_name NVARCHAR(100) NOT NULL,
    age INT NOT NULL,
    height_cm INT NOT NULL,
    weight_kg INT NOT NULL,
    prefered_foot NVARCHAR(10) NOT NULL
)

-- Create DIM_team dimension table
CREATE TABLE DIM_team(
    team_id INT IDENTITY PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    country NVARCHAR(100) NOT NULL
)

-- Create DIM_team_position dimension table
CREATE TABLE DIM_team_position(
    team_position_id INT IDENTITY PRIMARY KEY,
    position NVARCHAR(5) NOT NULL
)

-- Create DIM_nationality dimension table
CREATE TABLE DIM_nationality(
    nationality_id INT IDENTITY PRIMARY KEY,
    country NVARCHAR(30) NOT NULL
)

-- Create DIM_player_positions dimension table
CREATE TABLE DIM_player_positions(
    player_positions_id INT IDENTITY PRIMARY KEY,
    positions NVARCHAR(20) NOT NULL
)

-- Create DIM_player_tags dimension table
CREATE TABLE DIM_player_tags(
    player_tags_id INT IDENTITY PRIMARY KEY,
    tags NVARCHAR(100)
)

-- Create FACT_player_skills fact table
CREATE TABLE FACT_player_skills(
    player_skills_id INT IDENTITY PRIMARY KEY,
    player_id INT REFERENCES DIM_player(player_id),
    overall INT NOT NULL,
    potential INT NOT NULL,
    international_reputation INT NOT NULL,
    weak_foot INT NOT NULL,
    skill_moves INT NOT NULL,
    joined INT REFERENCES DIM_time(time_id),
    contract_valid_until_year INT NOT NULL,
    pace INT NOT NULL,
    shooting INT NOT NULL,
    passing INT NOT NULL,
    dribbling INT NOT NULL,
    defending INT NOT NULL,
    physic INT NOT NULL,
    gk_diving INT,
    gk_handling INT,
    gk_kicking INT,
    gk_reflexes INT,
    gk_speed INT,
    gk_positioning INT,
    nationality_id INT REFERENCES DIM_nationality(nationality_id),
    team_id INT REFERENCES DIM_team(team_id),
    team_position_id INT REFERENCES DIM_team_position(team_position_id),
    player_positions_id INT REFERENCES DIM_player_positions(player_positions_id),
    player_tags_id INT REFERENCES DIM_player_tags(player_tags_id)
)

-- Create FACT_matches fact table
CREATE TABLE FACT_matches(
    matches_id INT IDENTITY PRIMARY KEY,
    date_id INT REFERENCES DIM_time(time_id),
    team_1_id INT REFERENCES DIM_team(team_id),
    team_2_id INT REFERENCES DIM_team(team_id),
    FT_team_1 INT NOT NULL,
    FT_team_2 INT NOT NULL,
    HT_team_1 INT NOT NULL,
    HT_team_2 INT NOT NULL,
    GD INT NOT NULL,
    PTS_team_1 INT NOT NULL,
    PTS_team_2 INT NOT NULL
)
