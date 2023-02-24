

class DBpesadas{

  static String tableNamePesadas = 'tpesadas';
  static String  tablePesadas= '''    CREATE TABLE $tableNamePesadas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fecha TEXT,
    hora TEXT,
    indicador TEXT,
    lote TEXT,
    estado TEXT,
    caravana TEXT,
    peso TEXT
    )
  '''; 

  String fecha;
  String hora;
  String indicador;
  String lote;
  String estado;
  String caravana;
  String peso;

  DBpesadas({required this.fecha,required this.hora,required this.indicador,required this.lote,required this.estado,required this.caravana,required this.peso} );


  Map<String, dynamic> toMap() => {
      
        "fecha": fecha,
        "hora": hora,
        "indicador": indicador,
        "lote": lote,
        "estado": estado,
        "caravana": caravana,
        "peso": peso,
    };

}