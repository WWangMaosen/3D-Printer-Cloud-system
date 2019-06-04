<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <#--  <link rel="stylesheet" href="/static/layui/css/layui.css" media="all" />-->
    <link rel="stylesheet" href="${re.contextPath}/plugin/layui/css/layui.css">
    <script type="text/javascript" src="${re.contextPath}/plugin/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${re.contextPath}/plugin/echart/echarts.min.js"></script>
    <style>
        body{margin: 10px;}
    </style>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">

        <div class="layui-col-sm12 layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">喷头1温度数据（T1：℃）</div>
                <div class="layui-card-body" style="min-height: 280px;">
                    <div id="main1" class="layui-col-sm12" style="height: 300px;"></div>

                </div>
            </div>
        </div>

        <div class="layui-col-sm12 layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">喷头2温度数据（T2：℃）</div>
                <div class="layui-card-body" style="min-height: 280px;">
                    <div id="main2" class="layui-col-sm12" style="height: 300px;"></div>

                </div>
            </div>
        </div>


        <div class="layui-col-sm12 layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">热床温度数据（T3：℃）</div>
                <div class="layui-card-body" style="min-height: 280px;">
                    <div id="main3" class="layui-col-sm12" style="height: 300px;"></div>

                </div>
            </div>
        </div>



        <div class="layui-col-sm12 layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">X轴位置数据（X：mm）</div>
                <div class="layui-card-body" style="min-height: 280px;">
                    <div id="main4" class="layui-col-sm12" style="height: 300px;"></div>

                </div>
            </div>
        </div>



        <div class="layui-col-sm12 layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">Y轴位置数据（Y：mm）</div>
                <div class="layui-card-body" style="min-height: 280px;">
                    <div id="main5" class="layui-col-sm12" style="height: 300px;"></div>

                </div>
            </div>
        </div>


        <div class="layui-col-sm12 layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">Z轴位置数据（Z：mm）</div>
                <div class="layui-card-body" style="min-height: 280px;">
                    <div id="main6" class="layui-col-sm12" style="height: 300px;"></div>

                </div>
            </div>
        </div>


        <div class="layui-col-sm12 layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">挤料数据（E：mm）</div>
                <div class="layui-card-body" style="min-height: 280px;">
                    <div id="main7" class="layui-col-sm12" style="height: 300px;"></div>

                </div>
            </div>
        </div>



    </div>
</div>
</div>

<#--<script src="https://cdn.bootcss.com/echarts/4.2.1-rc1/echarts.min.js"></script>-->
<script type="text/javascript">

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main7'));
    var myChart2 = echarts.init(document.getElementById('main1'));
    var myChart3 = echarts.init(document.getElementById('main2'));
    var myChart4 = echarts.init(document.getElementById('main3'));
    var myChart5 = echarts.init(document.getElementById('main4'));
    var myChart6 = echarts.init(document.getElementById('main5'));
    var myChart7 = echarts.init(document.getElementById('main6'));
    var T1data = [];
    var T2data = [];
    var T3data =[];
    var Edata =  [];
    var Xdata = [];
    var Ydata =[];
    var Zdata =[];
    var Tdata =[];
    var T1 = [];
    var T2= [];
    var T3=[];
    var X=[];
    var Y=[];
    var Z=[];
    var E = [];
    var now;

    var oneDay = 24 * 3600 * 1000;
    var value = Math.random() * 1000;



    option = {
        title: {
            // text: '挤料数据'
        },
        tooltip: {
            trigger: 'axis',
            formatter: function (params) {
                params = params[0];
                var date = new Date(params.name);
                return date.getHours() + ':' + date.getMinutes() +":"+date.getSeconds()+ ' ' + date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear() + ' : ' + params.value[1];
            },
            axisPointer: {
                animation: false
            }
        },
        xAxis: {
            type: 'time',
            splitLine: {
                show: false
            }

        },
        yAxis: {
            type: 'value',
            boundaryGap: [0, '100%'],
            splitLine: {
                show: false
            }
        },
        series: [{
            name: '挤料数据',
            type: 'line',
            showSymbol: false,
            hoverAnimation: false,
            data: Edata,
            smooth: true
        }]
    };

    option2 = {
        title: {
            // text: '挤料数据'
        },
        tooltip: {
            trigger: 'axis',
            formatter: function (params) {
                params = params[0];
                var date = new Date(params.name);
                return date.getHours() + ':' + date.getMinutes() +":"+date.getSeconds()+ ' ' + date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear() + ' : ' + params.value[1];
            },
            axisPointer: {
                animation: false
            }
        },
        xAxis: {
            type: 'time',
            splitLine: {
                show: false
            }

        },
        yAxis: {
            type: 'value',
            boundaryGap: [0, '100%'],
            splitLine: {
                show: false
            }
        },
        series: [{
            name: '喷头1温度',
            type: 'line',
            showSymbol: false,
            hoverAnimation: false,
            data: Edata,
            smooth: true
        }]
    };
    option3 = {
        title: {
            // text: '挤料数据'
        },
        tooltip: {
            trigger: 'axis',
            formatter: function (params) {
                params = params[0];
                var date = new Date(params.name);
                return date.getHours() + ':' + date.getMinutes() +":"+date.getSeconds()+ ' ' + date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear() + ' : ' + params.value[1];
            },
            axisPointer: {
                animation: false
            }
        },
        xAxis: {
            type: 'time',
            splitLine: {
                show: false
            }

        },
        yAxis: {
            type: 'value',
            boundaryGap: [0, '100%'],
            splitLine: {
                show: false
            }
        },
        series: [{
            name: '喷头2温度',
            type: 'line',
            showSymbol: false,
            hoverAnimation: false,
            data: Edata,
            smooth: true
        }]
    };
    option4 = {
        title: {
            // text: '挤料数据'
        },
        tooltip: {
            trigger: 'axis',
            formatter: function (params) {
                params = params[0];
                var date = new Date(params.name);
                return date.getHours() + ':' + date.getMinutes() +":"+date.getSeconds()+ ' ' + date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear() + ' : ' + params.value[1];
            },
            axisPointer: {
                animation: false
            }
        },
        xAxis: {
            type: 'time',
            splitLine: {
                show: false
            }

        },
        yAxis: {
            type: 'value',
            boundaryGap: [0, '100%'],
            splitLine: {
                show: false
            }
        },
        series: [{
            name: '喷头3温度',
            type: 'line',
            showSymbol: false,
            hoverAnimation: false,
            data: Edata,
            smooth: true
        }]
    };
    option5 = {
        title: {
            // text: '挤料数据'
        },
        tooltip: {
            trigger: 'axis',
            formatter: function (params) {
                params = params[0];
                var date = new Date(params.name);
                return date.getHours() + ':' + date.getMinutes() +":"+date.getSeconds()+ ' ' + date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear() + ' : ' + params.value[1];
            },
            axisPointer: {
                animation: false
            }
        },
        xAxis: {
            type: 'time',
            splitLine: {
                show: false
            }

        },
        yAxis: {
            type: 'value',
            boundaryGap: [0, '100%'],
            splitLine: {
                show: false
            }
        },
        series: [{
            name: 'X轴坐标',
            type: 'line',
            showSymbol: false,
            hoverAnimation: false,
            data: Edata,
            smooth: true
        }]
    };
    option6 = {
        title: {
            // text: '挤料数据'
        },
        tooltip: {
            trigger: 'axis',
            formatter: function (params) {
                params = params[0];
                var date = new Date(params.name);
                return date.getHours() + ':' + date.getMinutes() +":"+date.getSeconds()+ ' ' + date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear() + ' : ' + params.value[1];
            },
            axisPointer: {
                animation: false
            }
        },
        xAxis: {
            type: 'time',
            splitLine: {
                show: false
            }

        },
        yAxis: {
            type: 'value',
            boundaryGap: [0, '100%'],
            splitLine: {
                show: false
            }
        },
        series: [{
            name: 'Y轴坐标',
            type: 'line',
            showSymbol: false,
            hoverAnimation: false,
            data: Edata,
            smooth: true
        }]
    };
    option7 = {
        title: {
            // text: '挤料数据'
        },
        tooltip: {
            trigger: 'axis',
            formatter: function (params) {
                params = params[0];
                var date = new Date(params.name);
                return date.getHours() + ':' + date.getMinutes() +":"+date.getSeconds()+ ' ' + date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear() + ' : ' + params.value[1];
            },
            axisPointer: {
                animation: false
            }
        },
        xAxis: {
            type: 'time',
            splitLine: {
                show: false
            }

        },
        yAxis: {
            type: 'value',
            boundaryGap: [0, '100%'],
            splitLine: {
                show: false
            }
        },
        series: [{
            name: 'Z轴坐标',
            type: 'line',
            showSymbol: false,
            hoverAnimation: false,
            data: Edata,
            smooth: true
        }]
    };




    myChart.setOption(option);
    myChart2.setOption(option2);
    myChart3.setOption(option3);
    myChart4.setOption(option4);
    myChart5.setOption(option5);
    myChart6.setOption(option6);
    myChart7.setOption(option7);





    setInterval(function () {
        $.ajax({
            url: 'getStateData'
            ,type:'post'
            ,success: function(ss){
                console.log(now);
                console.log(ss);
                var jsobject = JSON.parse(ss);
                E = jsobject.P.E;
                T1 = jsobject.S.T1;
                T2 = jsobject.S.T2;
                T3= jsobject.S.T3;
                X = jsobject.P.X;
                Y = jsobject.P.Y;
                Z = jsobject.P.Z;
                console.log("lll"+E);
                console.log("222"+T1);
                console.log("333"+X);
            }
        });

        now = new Date().getTime();
        Edata.push({name:now.toString(),value:[now,E] });
        T1data.push({name:now.toString(),value:[now,T1]});
        T2data.push({name:now.toString(),value:[now,T2]});
        T3data.push({name:now.toString(),value:[now,T3]});
        Xdata.push({name:now.toString(),value:[now,X]});
        Ydata.push({name:now.toString(),value:[now,Y]});
        Zdata.push({name:now.toString(),value:[now,Z]});

        myChart.setOption({
            series: [{
                data: Edata
            }]
        });

        myChart2.setOption({
            series: [{
                data: T1data
            }]
        });

        myChart3.setOption({
            series: [{
                data: T2data
            }]
        });

        myChart4.setOption({
            series: [{
                data: T3data
            }]
        });

        myChart5.setOption({
            series: [{
                data: Xdata
            }]
        });

        myChart6.setOption({
            series: [{
                data: Ydata
            }]
        });

        myChart7.setOption({
            series: [{
                data: Zdata
            }]
        });

    },1000);
    // 使用刚指定的配置项和数据显示图表。
    //


</script>

</body>
</html>