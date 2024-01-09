import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_fusioncharts/flutter_fusioncharts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ColumnChart(),
    );
  }

}

class ColumnChart extends StatefulWidget {
  const ColumnChart({super.key});

  @override
  State<ColumnChart> createState() => _ColumnChartState();
}

class _ColumnChartState extends State<ColumnChart> {
  late FusionCharts _fusionChart2D;
  FusionChartsController fusionChartsController = FusionChartsController();

  @override
  void initState() {
    super.initState();

    /// Prameters to define the chart configuations i.e captions,
    /// x and y axis labels, style etc. There are hoards of options that
    /// can be used to do customize the chart. Details here:
    /// https://www.fusioncharts.com/dev/fusioncharts
    Map<String, dynamic> chart = {
      "caption": "Countries With Most Oil Reserves [2017-18]",
      "subCaption": "In MMbbl = One Million barrels",
      "logoURL":
          "https://static.fusioncharts.com/sampledata/images/Logo-HM-72x72.png",
      "logoAlpha": "100",
      "logoScale": "110",
      "logoPosition": "TL",
      "xAxisName": "Country",
      "yAxisName": "Reserves (MMbbl)",
      "numberSuffix": "K",
      "theme": "carbon",
      "baseFontSize": "35px",
      "captionFontSize": "35px",
      "subCaptionFontSize": "30px"
    };

    /// Provide the underlying data for the chart.
    List<dynamic> chartData = [
      {"label": "Venezuela", "value": "290"},
      {"label": "Saudi", "value": "260"},
      {"label": "Canada", "value": "180"},
      {"label": "Iran", "value": "140"},
      {"label": "Russia", "value": "115"},
      {"label": "UAE", "value": "100"},
      {"label": "US", "value": "30"},
      {"label": "China", "value": "30"}
    ];

    /// Final datasource to be fed to the FusionCharts
    Map<String, dynamic> dataSource = {"chart": chart, "data": chartData};

    // Instantiate FusionCharts widget with following properties
    _fusionChart2D = FusionCharts(
      dataSource: dataSource, // Map constructed above
      type: "column2d", // Type of chart
      width: "100%", // Width of the chart (for best results, use 100% only)
      height:
          "100%", // Height of the chart (manage the chart size on page using Container/SizedBox)
      events: const [
        'chartClick'
      ], // Specify list of chart events that you want to listen to. For example `chartClick` is being setup
      fusionChartEvent:
          callBackFromPlugin, // Calllback on trigger of event. You can use chart id and event type to build responsive charts
      fusionChartsController:
          fusionChartsController, // Optional controller using which you can subscribe to events, unsubscribe and execute JavaScript based APIs
      // licenseKey: licenseKey
    );
    
    print(dataSource); // Optional, previde valid license key to remove the Trial Version watermark
  }

  /// Event triggered from the Fusion Charts library which triggers this callback method
  void callBackFromPlugin(senderId, eventType) {
    // if (kDebugMode) {
       print('Event Back to consumer: $senderId , $eventType');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return 
    // const Directionality(
     // textDirection: TextDirection.ltr,
     CupertinoPageScaffold(
        child: 
        
           Center(
             child: Center(
              
                child: _fusionChart2D
                ),
           ),
       // ),
     // ),
    );
  }
}
