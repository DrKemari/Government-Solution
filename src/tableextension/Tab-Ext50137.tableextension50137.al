#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50137 "tableextension50137" extends "Administration Cue" 
{
    fields
    {
        field(50027;"Requests to Approve";Integer)
        {
            CalcFormula = count("Approval Entry" where ("Approver ID"=field("User ID Filter"),
                                                        Status=filter(Open)));
            Caption = 'Requests to Approve';
            FieldClass = FlowField;
        }
        field(50028;"Requests Sent for Approval";Integer)
        {
            CalcFormula = count("Approval Entry" where ("Sender ID"=field("User ID Filter"),
                                                        Status=filter(Open)));
            Caption = 'Requests Sent for Approval';
            FieldClass = FlowField;
        }
    }
}

