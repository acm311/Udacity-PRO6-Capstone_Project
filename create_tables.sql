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

-- Create STAGING_FIFA_PLAYERS Staging table
CREATE TABLE STAGING_FIFA_PLAYERS(
    sofifa_id TEXT,
    player_url TEXT,
    short_name TEXT,
    long_name TEXT,
    age TEXT,
    dob TEXT,
    height_cm TEXT,
    weight_kg TEXT,
    nationality TEXT,
    club TEXT,
    overall TEXT,
    potential TEXT,
    value_eur TEXT,
    wage_eur TEXT,
    player_positions TEXT,
    preferred_foot TEXT,
    international_reputation TEXT,
    weak_foot TEXT,
    skill_moves TEXT,
    release_clause_eur TEXT,
    player_tags TEXT,
    team_position TEXT,
    team_jersey_number TEXT,
    joined TEXT,
    contract_valid_until TEXT,
    nation_position TEXT,
    nation_jersey_number TEXT,
    pace TEXT,
    shooting TEXT,
    passing TEXT,
    dribbling TEXT,
    defending TEXT,
    physic TEXT,
    gk_diving TEXT,
    gk_handling TEXT,
    gk_kicking TEXT,
    gk_reflexes TEXT,
    gk_speed TEXT,
    gk_positioning TEXT,
    attacking_crossing TEXT,
    attacking_finishing TEXT,
    attacking_heading_accuracy TEXT,
    attacking_short_passing TEXT,
    attacking_volleys TEXT,
    skill_dribbling TEXT,
    skill_curve TEXT,
    skill_fk_accuracy TEXT,
    skill_long_passing TEXT,
    skill_ball_control TEXT,
    movement_acceleration TEXT,
    movement_sprint_speed TEXT,
    movement_agility TEXT,
    movement_reactions TEXT,
    movement_balance TEXT,
    power_shot_power TEXT,
    power_jumping TEXT,
    power_stamina TEXT,
    power_strength TEXT,
    power_long_shots TEXT,
    mentality_aggression TEXT,
    mentality_interceptions TEXT,
    mentality_positioning TEXT,
    mentality_vision TEXT,
    mentality_penalties TEXT,
    mentality_composure TEXT,
    defending_marking TEXT,
    defending_standing_tackle TEXT,
    defending_sliding_tackle TEXT,
    goalkeeping_diving TEXT,
    goalkeeping_handling TEXT,
    goalkeeping_kicking TEXT,
    goalkeeping_positioning TEXT,
    goalkeeping_reflexes TEXT
)

-- Create STAGING_EURO_LEAGUE Staging table
CREATE TABLE STAGING_EURO_LEAGUE(
    Round TEXT,
    Date TEXT,
    Team_1 TEXT,
    FT TEXT,
    HT TEXT,
    Team_2 TEXT,
    Year TEXT,
    Country TEXT,
    FT_Team_1 TEXT,
    FT_Team_2 TEXT,
    HT_Team_1 TEXT,
    HT_Team_2 TEXT,
    GGD TEXT,
    Team_1_pts TEXT,
    Team_2_pts TEXT
)