
class XMLvariables{

  static final XMLvariables _xmLvariables = XMLvariables._internal();

  factory XMLvariables(){
    return _xmLvariables;
  }

  XMLvariables._internal();
  
  ///Crea la cabecera para un libro de excel
  static const String createBook =
                      "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n<?mso-application progid=\"Excel.Sheet\"?>\n<Workbook xmlns=\"urn:schemas-microsoft-com:office:spreadsheet\"\nxmlns:o=\"urn:schemas-microsoft-com:office:office\"\nxmlns:x=\"urn:schemas-microsoft-com:office:excel\"\nxmlns:ss=\"urn:schemas-microsoft-com:office:spreadsheet\">\nxmlns:html=\"http://www.w3.org/TR/REC-html40\">\n <DocumentProperties xmlns=\"urn:schemas-microsoft-com:office:office\">\n  <Version>12.00</Version>\n </DocumentProperties>\n <ExcelWorkbook xmlns=\"urn:schemas-microsoft-com:office:excel\">\n  <WindowHeight>10005</WindowHeight>\n  <WindowWidth>10005</WindowWidth>\n  <WindowTopX>120</WindowTopX>\n  <WindowTopY>135</WindowTopY>\n  <ActiveSheet>4</ActiveSheet>\n  <ProtectStructure>False</ProtectStructure>\n  <ProtectWindows>False</ProtectWindows>\n </ExcelWorkbook>\n<Styles>\n  <Style ss:ID=\"s62\">\n   <Interior ss:Color=\"#FB4A4A\" ss:Pattern=\"Solid\"/>\n  </Style>\n  <Style ss:ID=\"s63\">\n   <Interior ss:Color=\"#FFFF00\" ss:Pattern=\"Solid\"/>\n  </Style>\n  <Style ss:ID=\"s66\">\n   <Borders>\n    <Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\n    <Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\n    <Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\n    <Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\n   </Borders>\n  </Style>\n  <Style ss:ID=\"s67\">\n   <Borders>\n    <Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\n    <Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\n    <Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\n    <Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\n   </Borders>\n   <Interior ss:Color=\"#FFFF00\" ss:Pattern=\"Solid\"/>\n  </Style>\n  <Style ss:ID=\"s73\">\n   <Alignment ss:Vertical=\"Bottom\"/>\n   <Borders/>\n   <Font ss:FontName=\"Calibri\" x:Family=\"Swiss\" ss:Size=\"11\" ss:Color=\"#FFFFFF\"\n    ss:Bold=\"1\"/>\n   <Interior ss:Color=\"#002060\" ss:Pattern=\"Solid\"/>\n   <NumberFormat/>\n   <Protection/>\n  </Style>\n  <Style ss:ID=\"s100\">\n   <Alignment ss:Horizontal=\"Center\" ss:Vertical=\"Center\"/>\n   <Font ss:FontName=\"Cambria\" x:Family=\"Roman\" ss:Size=\"48\" ss:Color=\"#1F497D\"\n    ss:Bold=\"1\"/>\n   <Interior/>\n  </Style>\n  <Style ss:ID=\"s110\">\n   <Interior ss:Color=\"#049FCC\" ss:Pattern=\"Solid\"/>\n  </Style>\n  <Style ss:ID=\"s111\">\n   <Interior ss:Color=\"#04CC19\" ss:Pattern=\"Solid\"/>\n  </Style>\n  <Style ss:ID=\"s112\">\n   <Interior ss:Color=\"#FB3512\" ss:Pattern=\"Solid\"/>\n  </Style>\n<Style ss:ID=\"s92\">\n   <Alignment ss:Horizontal=\"Center\" ss:Vertical=\"Center\"/>\n   <Font ss:FontName=\"Cambria\" x:Family=\"Roman\" ss:Size=\"48\" ss:Color=\"#1F497D\"\n    ss:Bold=\"1\"/>\n  </Style> </Styles>\n";

  static crearHoja(String nombreHoja){

    final String hoja = "<Worksheet ss:Name=\"$nombreHoja\">\n" "<Names><NamedRange ss:Name=\"_FilterDatabase\" ss:RefersTo=\"=DESCARGAS!R5C1:R5C7\" ss:Hidden=\"1\"/></Names>\n";

    return hoja;  
  }
  /// [expandedColumnCount] Cantidad de columnas que tiene la tabla
  static abrirTabla(int expandedColumnCount){
    final String abrirTabla = "<Table ss:ExpandedColumnCount=\"$expandedColumnCount\" x:FullColumns=\"1\"\n" "   x:FullRows=\"1\" ss:DefaultColumnWidth=\"81.75\" ss:DefaultRowHeight=\"15\">\n";
    return abrirTabla;
  }

  static crearEncabezado(List<String> nombres){
    String campos ='';

    for (var i = 0; i < nombres.length; i++) {
      campos += "<Cell ss:StyleID=\"s73\"><Data ss:Type=\"String\">${nombres[i]}</Data><NamedCell ss:Name=\"_FilterDatabase\"/></Cell>\n"; 
    }  

    String encabezado = "<Row ss:AutoFitHeight=\"0\">\n" "    <Cell ss:MergeAcross=\"11\" ss:MergeDown=\"3\" ss:StyleID=\"s100\"><Data\n" "      ss:Type=\"String\">Balanzas Hook ST-456</Data></Cell>\n" "   </Row>\n" "   <Row ss:AutoFitHeight=\"0\" ss:Span=\"2\"/>\n" "<Row ss:Index=\"5\">\n" '$campos' 
                          
                      "</Row>\n";

    return encabezado;

  }

  static crearFilas(List<Map<String, dynamic>> listaDatos){
  
    String cells = "";
    for (var j = 0; j < listaDatos.length; j++) {
      cells += "<Row>\n";

      for (var i = 0; i < listaDatos[j].keys.length; i++) {
        cells += "<Cell><Data ss:Type=\"String\">" '${listaDatos[j].values.elementAt(i)}' "</Data></Cell>\n";
      }

      cells += "</Row>\n";
    }
    
    return cells;
  } 

  static cerrarHoja(String range){
    String cierre = " <WorksheetOptions xmlns=\"urn:schemas-microsoft-com:office:excel\">\n   <Unsynced/>\n   <Panes>\n    <Pane>\n     <Number>3</Number>\n     <ActiveRow>15</ActiveRow>\n     <ActiveCol>5</ActiveCol>\n    </Pane>\n   </Panes>\n   <ProtectObjects>False</ProtectObjects>\n   <ProtectScenarios>False</ProtectScenarios>\n  </WorksheetOptions>\n  <AutoFilter x:Range=\"R5C1:R5C$range\"\n   xmlns=\"urn:schemas-microsoft-com:office:excel\">\n  </AutoFilter>\n  <ss:WorksheetOptions/>\n  <ss:WorksheetOptions/>\n   </Worksheet>\n";

    return cierre;
    
  }
    
  static String cerrarTabla = "</Table>\n";
  static String cerrarLibro = "</Workbook>\n";
} 