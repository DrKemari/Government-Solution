#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50097 "tableextension50097" extends Rating 
{
    fields
    {
        modify("Profile Questionnaire Line No.")
        {
            TableRelation = "Profile Questionnaire Line"."Line No." where ("Profile Questionnaire Code"=field("Profile Questionnaire Code"),"Contact Class. Field"=const(Rating));
        }
        modify("Rating Profile Quest. Line No.")
        {
            TableRelation = "Profile Questionnaire Line"."Line No." where ("Profile Questionnaire Code"=field("Rating Profile Quest. Code"),
                                                                           Type=const(Question));
        }
    }
}

