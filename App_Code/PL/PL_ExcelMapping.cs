using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PL_ExcelMapping
/// </summary>
public class PL_ExcelMapping
{
	public PL_ExcelMapping()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int Ind { get; set; }
    public int ClientCode { get; set; }
    public string ClientExcelField { get; set; }
    public string OdpExcelField { get; set; }
    public string MappingName { get; set; }
    public int MappingId { get; set; }
}