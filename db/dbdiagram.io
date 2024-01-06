// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs
// vikash1111@mailinator.com 

Table status {
  id integer [primary key]
  status varchar(20) [not null]
  create_user integer [not null, default:0]
  modify_user integer
  created_at timestamptz [not null, default:`now()`]
  modified_at timestamptz
}

Table roles {
  role_id integer [primary key]
  role_name varchar(20)
  status_id integer [ref: > status.id]
  create_user integer [not null, default: 0]
  modify_user integer 
  created_at timestamptz [not null, default: `now()`]
  modified_at timestamptz
  visible boolean [not null, default:true]
}

Table users {
  id bigserial [primary key]
  unique_id uuid [not null]
  role_id integer [ref: > roles.role_id]
  first_name varchar [not null]
  middle_name varchar
  last_name varchar [not null]
  dob date
  country_code varchar [not null]
  phone varchar [not null]
  email varchar
  salt varchar
  password varchar
  status_id integer [ref: > status.id]
  create_user integer [not null, default:0]
  modify_user integer
  created_at timestamptz [not null, default:`now()`]
  modified_at timestamptz

  Indexes {
    unique_id
    phone
  }
}

Table users_address {
  id bigserial [primary key]
  User_id integer [ref: > users.unique_id]
  address1 varchar [not null]
  address2 varchar
  address3 varchar
  address4 varchar
  location varchar [not null]
  status_id integer [ref: > status.id]
  create_user integer [not null, default:0]
  modify_user integer 
  created_at timestamptz [not null, default:`now()`]
  modified_at timestamptz

  Indexes {
    User_id
  }
}


// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs

Table notification {
  id integer
  status varchar [not null, default: "Suspended"]
  create_user integer [not null, default: 0]
  modify_user integer
  created_at timestamptz [not null, default: `now()`]
  modified_at timestamptz
}


Table services {
  id integer [primary key]
  title varchar(50)
  short_name varchar(30)
  description text
  send_notification integer
  status varchar [not null, default: "Suspended"]
  create_user integer [not null, default: 0]
  modify_user integer
  created_at timestamptz [not null, default: `now()`]
  modified_at timestamptz
}
