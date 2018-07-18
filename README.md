# FoxCharts

翻译：xinjie  2018.07.18

**基于 GdiPlusX 中 ImageCanvas 类的子类, 它允许 VFP 开发人员直接绘制图表。**

项目管理者: Cesar ([vfpimaging@hotmail.com](mailto:vfpimaging@hotmail.com)) 截至版本 1.37

项目管理者: YudinAlexKiev (alex.yudin.49@mail.ru) 版本 1.4x

FoxCharts 的目的：
* 使用 VFP 代码创建炫酷的图表
* 无需 ActiveX 组件
* 很容易的进行设置
* 很容易的进行自定义
* 很容易的将图表保存到磁盘或打印输出
* 开源
* 受益于 GdiPlusX 的绘图功能, 允许用户根据自己喜欢的方式修改图表
* 保存为 EMF（译者注：一种矢量图形格式）, 在 VFP 报表打印时生成完美的图表
* 对图表形状的完全控制
* 提示信息
* 鼠标控制

使用的前提条件：
* Visual FoxPro 9 和来自 VFPX 的 GdiPlusX 库

当前可用的图表：

(猫了个咪，图表名称不好翻译，直译...)

* 使用渐变、自定义颜色、透明、基本和随机颜色的各种颜色变体中的单个条形、多个条形、堆积条形、形状或点、线条、区域、饼图图表。
* 标题，副标题和图例
* 坐标轴和坐标刻度
* 在形状上绘制文本

## 例子

有关此版本的更详细信息, 可以在 FoxCharts 压缩文件中的 TXT 文件中找到。

要了解 FoxCharts 可以做什么, 请下载上面的文件并运行可用的示例, 并尝试所有选项。

要开始运行示例，仅需运行 Samples 文件夹下的 DEMOSTART.PRG 。

![](FoxCharts_1Donut.png)
![](FoxCharts_2Line.png)
![](FoxCharts_3multibar.png)
![](FoxCharts_4monoch.png)
![](FoxCharts_5Pie.png)
![](FoxCharts_6Shapes.png)
![](FoxCharts_7Stacked.png)
![](FoxCharts_8Area.png)
![](FoxCharts_FoxChartsNew_4.png)
![](FoxCharts_FoxChartsNew_3.png)

## JRN FoxCharts 工具

此工具包包含一些不属于 FoxCharts 的附加工具:

** VisualChartDesigner: 允许开发人员或最终用户对 FoxCharts 属性进行更改, 并看到它们的即时效果的工具。通过将 VisualChartDesigner.vcx 中的 cmdChartOptions 控件添加到图表的 FoxCharts 容器中, 可以将 VisualChartDesigner 添加到任何现有图表中。

** GetChartDataFromRows: 一种 PRG, 将起始于行中的数据序列转换为 FoxCharts 所需的格式 (每个数据序列都在同一字段中)。

![](FoxCharts%20Tools_VisualChartDesigner.png)

JRN_FoxCharts_Tools 目录包含以下文件：
* VisualChartDesigner.VCX
* GetChartDataFromRows.PRG
* Documentation 文件夹，它包含了每个工具的说明文档。
* Samples 文件夹，它包含了 VisualChartDesigner_Sample.SCX
* 一个附加的表单和类；你无需引用它们，它们用于  VisualChartDesigner 。

## Beta Update

*New features:*
* Introduced new Bar Types: Cone, Conoid, Pyramid and truncated pyramid (Frustum).
* Introduced new Brush Types: HatchBrush Color, Textures Brush
* Right-clicking on the SideLegends in the chart, can call a new form that allows you to interactively apply changes to the way the side legends appear. You can change the Legend positions, colors, and other character formatting.

*New properties:*
* GradientShapeDirection: Numeric, determines the Gradient Brush direction (0-3).
* GradientVertCount and GradientHorCount: Numeric, determines the Shape Gradient Brush stripes count (vertical and horizontal)

*Fixes:*  
Fix in "System.app". The distributed version avoids some bugs due to LOCAL variables declarations inside TRY/CATCH. May work faster in local net.

*VERY IMPORTANT:*  
Since this new version brings several modifications, the new and current Beta version is a subclass of the original and latest FoxCharts version v1.37. The new class is in the Foxcharts1.46_Beta folder, named FoxChartsBeta.vcx.

All new samples, the ones that will benefit from the newest features, are in the SamplesBeta folder.

Start playing with the ChartsSample_ArrowsInLegend.scx form.
- Change the spinner values to see the new charts available
- Click on the Side Legends, to see cool stripes 
- Right-click the over the SideLegends to call the new SideLegends form, and play with the new possibilities!

![](FoxChartsNew_4.png)

![](FoxChartsNew_3.png)

*Info for version 1.42 ALPHA*
- all objects of chart react on mousemove showing its contour
- all objects have their own form to adjust. Just Right Click on them.
- Right click on chart (not on objects) will call form to adjust common properties
- For ChartType=3 (single type) one can see arrows that show values o​f the increments
- Title and subtitle can use chr(13)+chr(10) inside
- One can store properties in memo field of file ChartsList.
- Shape legend changed

*Info for version 1.43 ALPHA*
- New chart object- Comment. You can add new comment, edit and delete it(right click). As well as drag and drop existing comments object on chart.
- Start form Chartssample_v1_4x.scx from project. This is sample for all v.4x versions features.

*Info for version 1.43 BETA*
- Fixed bugs
- OO Writer report

*Info for version 1.44 Beta*
* New form charts_rowchange.scx demonstrates generating charts on  AfterRowColChange event of grid.
* Simple form ChartExport.scx demonstrates calls ChartExport.prg that send Chart image to Clipboard, MS Excel, MS Word, OO Writer and just to printer with no form at all.
* Read comments inside this ChartExport.prg

*Info for version 1.45*  
* New form ChartsMovie shows charts speed for different properties

*Info for version 1.45.2*  
* Multi BarChart.
* Collection Fields has new property Bartype.
* Look form AfterRowColChange.

*Info for version 1.45.3*  
* New propery "News". Form Chartssample_v1_4x start with Form.foxcharts1.News = .F.
* If you change any property News become = .T.
Checking GetChartProperties(3, .F. ) to be empty gives the same result as News=.F.

*Info for version 1.46 Beta*  
* New form chartssamples_v1_4x stands for calling forms of versions 1.4x
* New property "Sleep" - logical. When Sleep=.T. prevents unnecessary calling DrawChart (like Resize method).
* Form charts_rowchange.scx shows way to animated changing charts

*Info for version 1.46.1 Beta*  
* Now 3 1.4x sample forms include button "Form objects" (left top side) to look all form objects and their properties, methods and events.
* Object Shapes includes non visual auxiliary objects - one for each shape on canvas.
You can use this objects in your programs.

## Acknowledgements

Special thanks to: Bo Durban, James R. Nelson and Alex Yudin for their big contributions developing new possibilities.

Also to the very big list of contributors who have given lots of feedback, suggestions, reported bugs, asked for features.
You all rock guys !

THANKS SO MUCH !
