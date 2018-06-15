require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'd84p1gt92h8m2m', host: 'ec2-184-73-202-79.compute-1.amazonaws.com'
        port: '5432', user: 'ctmstspqidtxhr', password: 'cc2187ac8dd9edd96e4315cedba9322936050876b14c3be706e9564857872620' })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
