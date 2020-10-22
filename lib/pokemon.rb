class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(pokemon)
        @id = pokemon[:id]
        @name = pokemon[:name]
        @type = pokemon[:type]
        @db = pokemon[:db]
    end

    def self.save(name,type,db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT * FROM pokemon
            WHERE id = ?
            LIMIT 1
        SQL
        pokemon = db.execute(sql, id)
        new_pokemon = {:id => pokemon[0][0], :name => pokemon[0][1], :type => pokemon[0][2], :db => db}
        self.new(new_pokemon)
    end

end
