using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Watch
/// </summary>
public class Watch
{
    public Watch()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    //这样的表有点难受 但是按照那个啥范式来弄的话有点麻烦 索性这样 数据冗余就冗余吧
    /// <summary>
    /// 商品id
    /// </summary>
    public int Id { get; set; }
    /// <summary>
    /// 机芯类型
    /// </summary>
    public string Movement_Type { get; set; }
    /// <summary>
    /// 机芯类型
    /// </summary>
    public string Movement_model { get; set; }
    /// <summary>
    /// 商品名称
    /// </summary>
    public string Name { get; set; }
    /// <summary>
    /// 品牌
    /// </summary>
    public string Brand { get; set; }

    /// <summary>
    /// 图片信息
    /// </summary>
    public string Photo { get; set; }
    /// <summary>
    /// 建议使用者性别
    /// </summary>
    public string Sex { get; set; }
    /// <summary>
    /// 功能标签 用英文逗号分隔
    /// </summary>
    public string Tags { get; set; }
    /// <summary>
    /// 产品的描述
    /// </summary>
    public string Description { get; set; }
    /// <summary>
    /// 商品价格信息
    /// </summary>
    public decimal Price { get; set; }
    /// <summary>
    /// 系列Id
    /// </summary>
    public int SeriesId { get; set; }
    /// <summary>
    /// 防水情况
    /// </summary>
    public int Waterproof { get; set; }
    public string SeriesMap { get { return Series.GetName(SeriesId); } }

}