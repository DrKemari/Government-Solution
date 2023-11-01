#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50049 "tableextension50049" extends "Gen. Journal Batch"
{
    fields
    {
        field(50000; "User ID"; Code[100])
        {
            Caption = 'User ID';
            TableRelation = "User setup";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            var
                LoginMgt: Codeunit "User Management";
            begin
                //LoginMgt.LookupUserID("User ID");
            end;

            trigger OnValidate()
            var
                LoginMgt: Codeunit "User Management";
            begin
                //LoginMgt.ValidateUserID("User ID");
            end;
        }
    }
}

