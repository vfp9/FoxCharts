*** JRN 07/30/2009 
* 	获取存储在行而不是列中的图表数据并对其进行转换，以便FoxCharts可以使用它们：
*
*	此函数使用两个游标:
*		<tcDataAlias>:
*           每条记录对应一个数据系列（通常在<SourceAlias>中显示为一个字段）
*           因此，当使用 BROW 浏览游标数据时，就像在折线图或条形图中显示的那样。
*			此游标还可以包含额外(可选)的字段:
*				- 侧边图例名称 <tcFieldSideLegend>			= .Legends(N).Legend
*				- 自定义颜色 <tcFieldColor>					= .Legends(N).Color
*				- 线标记的形状 <tcFieldShape)				= .Legends(N).Shape
*		<tcRowAlias>
*			每条记录用于从<tcDataAlias>中为数据选择一个字段。 此游标中拥有两个字段:
*				-  包含 <tcDataAlias> 中数据字段名称的字段名... <tcFieldRow>
*				- 与数据字段对应的 X 轴刻度的文本 ... <tcFieldAxisLegend>

Lparameters 				;
	toFoxChart,				;
	tcDataAlias,			;
	tcFieldSideLegend,		;
	;
	tcRowAlias,				;
	tcFieldRow,				;
	tcFieldAxisLegend,		;
	;
	tcFieldColor,			;
	tcFieldShape

****************************************************************
* Parameters
*	toFoxChart			= FoxCharts 容器对象

*	tcDataAlias			= 原始数据源表名
*	tcFieldSideLegend	= 可选参数，原始数据源表中用于 侧边图例 的字段名

*	tcRowAlias			= 包含有关<tcDataAlias>中哪些字段包含数据信息的游标名称
*	tcFieldRow			= <tcRowAlias>中字段的名称，包含<tcDataAlias>中包含图表数据的字段的名称
*	tcFieldAxisLegend	= 可选参数，<tcRowAlias>中字段的名称，包含用作 X 轴刻度的文本

*	tcFieldColor		= 可选参数，包含自定义颜色的<tcDataAlias>中的字段名称
*	tcFieldShape		= 可选参数，包含线帽形状的<tcDataAlias>中的字段名称

Local Array laFields[1]
Local lcSourceAlias, lnRow, lcDataType, lcFieldName

With toFoxChart

	lcSourceAlias = tcDataAlias + "_Transposed"
	If Used (lcSourceAlias)
		Use In &lcSourceAlias
	Endif

	Select * 									;
		From (tcRowAlias)						;
		Into Cursor (lcSourceAlias) Readwrite

	.SourceAlias = lcSourceAlias
	If Not Empty (tcFieldAxisLegend)
		.FieldAxis2  = tcFieldAxisLegend
	Endif

	Afields(laFields, tcDataAlias)
	lnRow = Ascan(laFields, Trim(&tcFieldRow), -1, -1, 1, 15)
	lcDataType = laFields(lnRow,2) + "(" + Transform(laFields(lnRow,3)) + Iif(laFields(lnRow,2) = 'N', "," + Transform(laFields(lnRow,4)), '') + ")"

	Select (tcDataAlias)
	.ChartsCount = Reccount()
	Scan
		With .Fields(Recno())
			lcFieldName 	= 'Value' + Transform(Recno())
			.FieldValue 	= lcFieldName
			Alter Table (lcSourceAlias) Add Column (lcFieldName) &lcDataType Null

			If Not Empty (tcFieldSideLegend)
				.Legend		= Alltrim (&tcFieldSideLegend)
			Endif

			If Not Empty (tcFieldColor)
				.Color		= &tcFieldColor
			Endif

			If Not Empty (tcFieldShape)
				.Shape		= &tcFieldShape
			Endif

			Select (lcSourceAlias)
			Scan
				lcSourceField = &tcFieldRow
				Replace &lcFieldName With &tcDataAlias..&lcSourceField
			Endscan

		Endwith
	Endscan

Endwith

Return
