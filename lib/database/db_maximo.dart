
class DBPesadasMaximo{

static String tableNamePesadasMaximo = 'tpesadasMaximo';
  static String  tablePesadasMaximo= '''    CREATE TABLE $tableNamePesadasMaximo (
    id TEXT,
    maximo TEXT
    )
  '''; 

  String id;
  String maximo;

  DBPesadasMaximo({
    required this.id,
    required this.maximo,
  });

   Map<String, dynamic> toMap() => {
        "id": id,
        "maximo": maximo,
    };


}
