options = {
    apadter: 'postgresql',
    database: 'secondhandfurniture'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)