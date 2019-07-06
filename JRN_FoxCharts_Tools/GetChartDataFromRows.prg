*** JRN 07/30/2009 
* 	��ȡ�洢���ж��������е�ͼ�����ݲ��������ת�����Ա�FoxCharts����ʹ�����ǣ�
*
*	�˺���ʹ�������α�:
*		<tcDataAlias>:
*           ÿ����¼��Ӧһ������ϵ�У�ͨ����<SourceAlias>����ʾΪһ���ֶΣ�
*           ��ˣ���ʹ�� BROW ����α�����ʱ������������ͼ������ͼ����ʾ��������
*			���α껹���԰�������(��ѡ)���ֶ�:
*				- ���ͼ������ <tcFieldSideLegend>			= .Legends(N).Legend
*				- �Զ�����ɫ <tcFieldColor>					= .Legends(N).Color
*				- �߱�ǵ���״ <tcFieldShape)				= .Legends(N).Shape
*		<tcRowAlias>
*			ÿ����¼���ڴ�<tcDataAlias>��Ϊ����ѡ��һ���ֶΡ� ���α���ӵ�������ֶ�:
*				-  ���� <tcDataAlias> �������ֶ����Ƶ��ֶ���... <tcFieldRow>
*				- �������ֶζ�Ӧ�� X ��̶ȵ��ı� ... <tcFieldAxisLegend>

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
*	toFoxChart			= FoxCharts ��������

*	tcDataAlias			= ԭʼ����Դ����
*	tcFieldSideLegend	= ��ѡ������ԭʼ����Դ�������� ���ͼ�� ���ֶ���

*	tcRowAlias			= �����й�<tcDataAlias>����Щ�ֶΰ���������Ϣ���α�����
*	tcFieldRow			= <tcRowAlias>���ֶε����ƣ�����<tcDataAlias>�а���ͼ�����ݵ��ֶε�����
*	tcFieldAxisLegend	= ��ѡ������<tcRowAlias>���ֶε����ƣ��������� X ��̶ȵ��ı�

*	tcFieldColor		= ��ѡ�����������Զ�����ɫ��<tcDataAlias>�е��ֶ�����
*	tcFieldShape		= ��ѡ������������ñ��״��<tcDataAlias>�е��ֶ�����

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
