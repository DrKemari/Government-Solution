#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50048 "tableextension50048" extends "Post Code" 
{
    fields
    {
        field(85001;"County Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = County;

            trigger OnValidate()
            var
                CountyRec: Record County;
            begin
                CountyRec.Reset;
                CountyRec.SetRange(Code,"County Code");
                if CountyRec.FindFirst then
                  begin
                   County:=CountyRec.Description;
                  end
            end;
        }
    }
}

