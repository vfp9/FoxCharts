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

**VisualChartDesigner:** 允许开发人员或最终用户对 FoxCharts 属性进行更改, 并看到它们的即时效果的工具。通过将 VisualChartDesigner.vcx 中的 cmdChartOptions 控件添加到图表的 FoxCharts 容器中, 可以将 VisualChartDesigner 添加到任何现有图表中。

**GetChartDataFromRows:** 一个 PRG, 将起始于行中的数据序列转换为 FoxCharts 所需的格式 (每个数据序列都在同一字段中)。

![](FoxCharts%20Tools_VisualChartDesigner.png)

JRN_FoxCharts_Tools 目录包含以下文件：
* VisualChartDesigner.VCX
* GetChartDataFromRows.PRG
* Documentation 文件夹，它包含了每个工具的说明文档。
* Samples 文件夹，它包含了 VisualChartDesigner_Sample.SCX
* 一个附加的表单和类；你无需引用它们，它们用于  VisualChartDesigner 。

## Beta 版更新

*新功能：*
* 推出新的 Bar 类型：锥形，圆锥形，四棱锥体和截锥体。
* 推出新的刷子类型：HatchBrush Color, Textures Brush
* 右键单击图表中的侧边图例，可以调用一个新表单，该表单允许以交互方式更改应用于侧边图例的显示方式。 你可以更改图例位置，颜色和其他字符格式。

*新属性：*
* GradientShapeDirection: 数值型，确定渐变画笔方向（0-3）。
* GradientVertCount and GradientHorCount: 数值型，确定 Shape Gradient Brush 条纹数（垂直和水平方向）。

*修复：*  
修复 "System.app" 中的 BUG。在发布的版本中，如果在 TRY/CATCH 结构中使用 Local 语句，会触发一些 BUG，这在释放的版本中对此进行了规避。现在它可以工作的更高效。

*非常重要：*  
由于这个新版本带来了一些修改, 新的和当前的 Beta 版本是原始的和最新的 FoxCharts 版本 v1.37 的子类。新类位于 Foxcharts1.46_Beta 文件夹中, 名为 FoxChartsBeta. vcx。

所有新的示例 (将从最新的功能中受益) 都在 SamplesBeta 文件夹中。

开始使用 ChartsSample_ArrowsInLegend.scx 表单。
- 更改微调器值以查看可用的新图表
- 点击侧边图例，看看酷炫的条纹
- 右键单击侧边图例，调用新的 SideLegends 表单，并使用新的特性！

![](FoxChartsNew_4.png)

![](FoxChartsNew_3.png)

*version 1.42 ALPHA 的信息*
- 图表的所有对象都会在鼠标移动在其上时显示轮廓
- 所有对象都有属于自己的属性调整表单，而你要做的，仅仅是右击它们。
- 右键单击图表（不是对象）将调用表单来调整常用属性
- 对于ChartType = 3（单一类型），可以看到显示增量值的箭头
- 标题和副标题可以使用chr（13）+ chr（10）
- 可以在文件 ChartsList 的备注字段中存储属性设置。
- 图例做了一些更改

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

## 鸣谢

特别感谢：Bo Durban，James R. Nelson和Alex Yudin为开发新的可能性做出的巨大贡献。

此外，对于提供大量反馈，建议，错误报告，要求功能的名单数不胜数。
你们都是最棒的！

非常感谢 ！
