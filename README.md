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
* 推出新的刷子类型：颜色刷子和纹理刷子(HatchBrush Color, Textures Brush)
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

*version 1.43 ALPHA 的信息*
- 新的图表对象 - 注释。你现在可以增加一个新的注释，并且可以编辑和删除它（右击）。同时，你可以在图标中对它进行拖拽。
- 所有 v.4x 版本的特性，你可以在项目的 Chartssample_v1_4x.scx 表单中查看。

*version 1.43 BETA 的信息*
- 修复了一些 BUG
- 添加输出到 Open Office 。

*version 1.44 Beta 的信息*
* 新增表单 charts_rowchange.scx 演示了如何在 grid 的 AfterRowColChange 事件中生成图表。
* 示例表单 ChartExport.scx 演示了如何调用 ChartExport.prg ，它可以将图表输出到剪贴板、MS Excel、MS Word、Open Office 以及直接打印输出。
* 阅读 ChartExport.prg 中的注释

*version 1.45 的信息*  
* 新的示例表单 ChartsMovie 显示了针对不同的属性图表生成的速度。

*version 1.45.2 的信息*  
* 可以在一张图表中显示多种类型的图表。
* Collection 字段增加了新的属性 Bartype.
* 查阅 AfterRowColChange.

*version 1.45.3 的信息*  
* 新的属性 "News" 。表单 Chartssample_v1_4x 的初始设置是 Form.foxcharts1.News = .F.
* 如果你更改 News 属性值为 .T.，你可以使用 GetChartProperties(3, .F. ) 来获得和 News = .F. 一样的结果。

*version 1.46 Beta 的信息*  
* 新表单 chartssamples_v1_4x 作为调用 versions 1.4x 的标准表单。
* 新属性 "Sleep" - 逻辑型。当 Sleep = .T. 时可以避免频繁的调用 DrawChart (例如当你调整表单大小时).
* 表单 charts_rowchange.scx 演示了如何动画式的更改图表。

*version 1.46.1 Beta 的信息*  
* Now 3 1.4x sample forms include button "Form objects" (left top side) to look all form objects and their properties, methods and events.
* Object Shapes includes non visual auxiliary objects - one for each shape on canvas.
You can use this objects in your programs.

## 鸣谢

特别感谢：Bo Durban，James R. Nelson和Alex Yudin为开发新的可能性做出的巨大贡献。

此外，对于提供大量反馈，建议，错误报告，要求功能的名单数不胜数。
你们都是最棒的！

非常感谢 ！
