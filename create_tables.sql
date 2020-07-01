--DROP TABLE [dbo].[FACT_player_skills]
--DROP TABLE [dbo].[DIM_player]

-- Create DIM_time dimension table
CREATE TABLE DIM_time(
    time_id INT IDENTITY PRIMARY KEY,
    date date,
    day INT NOT NULL,
    day_name VARCHAR(30),
    month INT NOT NULL,
    month_name VARCHAR(30),
    year INT NOT NULL
)

-- Create DIM_player dimension table
CREATE TABLE DIM_player(
    player_id INT IDENTITY PRIMARY KEY,
    short_name NVARCHAR(100) NOT NULL,
    long_name NVARCHAR(100) NOT NULL,
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
    tags NVARCHAR(150)
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
    player_tags_id INT REFERENCES DIM_player_tags(player_tags_id),
    age INT NOT NULL
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
    sofifa_id VARCHAR(MAX),
    player_url VARCHAR(MAX),
    short_name VARCHAR(MAX),
    long_name VARCHAR(MAX),
    age VARCHAR(MAX),
    dob VARCHAR(MAX),
    height_cm VARCHAR(MAX),
    weight_kg VARCHAR(MAX),
    nationality VARCHAR(MAX),
    club VARCHAR(MAX),
    overall VARCHAR(MAX),
    potential VARCHAR(MAX),
    value_eur VARCHAR(MAX),
    wage_eur VARCHAR(MAX),
    player_positions VARCHAR(MAX),
    preferred_foot VARCHAR(MAX),
    international_reputation VARCHAR(MAX),
    weak_foot VARCHAR(MAX),
    skill_moves VARCHAR(MAX),
    release_clause_eur VARCHAR(MAX),
    player_tags VARCHAR(MAX),
    team_position VARCHAR(MAX),
    team_jersey_number VARCHAR(MAX),
    joined VARCHAR(MAX),
    contract_valid_until VARCHAR(MAX),
    nation_position VARCHAR(MAX),
    nation_jersey_number VARCHAR(MAX),
    pace VARCHAR(MAX),
    shooting VARCHAR(MAX),
    passing VARCHAR(MAX),
    dribbling VARCHAR(MAX),
    defending VARCHAR(MAX),
    physic VARCHAR(MAX),
    gk_diving VARCHAR(MAX),
    gk_handling VARCHAR(MAX),
    gk_kicking VARCHAR(MAX),
    gk_reflexes VARCHAR(MAX),
    gk_speed VARCHAR(MAX),
    gk_positioning VARCHAR(MAX),
    attacking_crossing VARCHAR(MAX),
    attacking_finishing VARCHAR(MAX),
    attacking_heading_accuracy VARCHAR(MAX),
    attacking_short_passing VARCHAR(MAX),
    attacking_volleys VARCHAR(MAX),
    skill_dribbling VARCHAR(MAX),
    skill_curve VARCHAR(MAX),
    skill_fk_accuracy VARCHAR(MAX),
    skill_long_passing VARCHAR(MAX),
    skill_ball_control VARCHAR(MAX),
    movement_acceleration VARCHAR(MAX),
    movement_sprint_speed VARCHAR(MAX),
    movement_agility VARCHAR(MAX),
    movement_reactions VARCHAR(MAX),
    movement_balance VARCHAR(MAX),
    power_shot_power VARCHAR(MAX),
    power_jumping VARCHAR(MAX),
    power_stamina VARCHAR(MAX),
    power_strength VARCHAR(MAX),
    power_long_shots VARCHAR(MAX),
    mentality_aggression VARCHAR(MAX),
    mentality_interceptions VARCHAR(MAX),
    mentality_positioning VARCHAR(MAX),
    mentality_vision VARCHAR(MAX),
    mentality_penalties VARCHAR(MAX),
    mentality_composure VARCHAR(MAX),
    defending_marking VARCHAR(MAX),
    defending_standing_tackle VARCHAR(MAX),
    defending_sliding_tackle VARCHAR(MAX),
    goalkeeping_diving VARCHAR(MAX),
    goalkeeping_handling VARCHAR(MAX),
    goalkeeping_kicking VARCHAR(MAX),
    goalkeeping_positioning VARCHAR(MAX),
    goalkeeping_reflexes VARCHAR(MAX)
)

-- Create STAGING_EURO_LEAGUE Staging table
CREATE TABLE STAGING_EURO_LEAGUE(
    Round VARCHAR(MAX),
    Date VARCHAR(MAX),
    Team_1 VARCHAR(MAX),
    FT VARCHAR(MAX),
    HT VARCHAR(MAX),
    Team_2 VARCHAR(MAX),
    Year VARCHAR(MAX),
    Country VARCHAR(MAX),
    FT_Team_1 VARCHAR(MAX),
    FT_Team_2 VARCHAR(MAX),
    HT_Team_1 VARCHAR(MAX),
    HT_Team_2 VARCHAR(MAX),
    GGD VARCHAR(MAX),
    Team_1_pts VARCHAR(MAX),
    Team_2_pts VARCHAR(MAX)
)