//orcl
dataSource {
    pooled = true
    driverClassName = "oracle.jdbc.OracleDriver"
    dialect = org.hibernate.dialect.Oracle10gDialect

//*//ics server
    username = "MYTEST"
    password = "mytest"
//    */
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory'
    jdbc.use_get_generated_keys = true
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate'
            url = "jdbc:oracle:thin:@localhost:1521:ORCL"//icab live
        }
    }
    test {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate'
            url = "jdbc:oracle:thin:@localhost:1521:ORCL"//icab live
        }
    }
    production {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate'
            url = "jdbc:oracle:thin:@localhost:1521:ORCL"//icab live
        }
    }
}
