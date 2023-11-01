#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51549 "Audit Plan Statistics"
{
    PageType = CardPart;
    SourceTable = "Audit Plan Header";

    layout
    {
        area(content)
        {
            field("Code"; Rec.Code)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Code field.';
            }
            field(Description; Rec.Description)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Description field.';
            }
            field("No. Of Programme Engagements"; NoOfProgrammeEngagements)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfProgrammeEngagements field.';
            }
            field("No. Of Institution Engagements"; NoOfInstitutionEngagements)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfInstitutionEngagements field.';
            }
            field("No. Of AdHoc Engagements"; NoOfAdHocEngagements)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfAdHocEngagements field.';
            }
            field("No. Of Programme SAR"; NoOfSAR)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfSAR field.';
            }
            field("No. Of Programme Responses"; NoOfProgrammeResponse)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfProgrammeResponse field.';
            }
            field("No. Of Institution Responses"; NoOfInstitutionResponse)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfInstitutionResponse field.';
            }
        }
    }

    actions
    {
    }

    var
        NoOfProgrammeEngagements: Integer;
        NoOfInstitutionEngagements: Integer;
        NoOfAdHocEngagements: Integer;
        NoOfSAR: Integer;
        NoOfProgrammeResponse: Integer;
        NoOfInstitutionResponse: Integer;
}

