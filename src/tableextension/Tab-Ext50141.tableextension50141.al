#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50141 "tableextension50141" extends "Email Item" 
{

    //Unsupported feature: Variable Insertion (Variable: MaxLength) (VariableCollection) on "SetBodyText(PROCEDURE 5)".


    //Unsupported feature: Code Modification on "SetBodyText(PROCEDURE 5)".

    //procedure SetBodyText();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CLEAR(Body);
        BodyText.ADDTEXT(Value);
        Body.CREATEOUTSTREAM(DataStream,TEXTENCODING::UTF8);
        BodyText.WRITE(DataStream);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CLEAR(Body);
        //Value:='';
        {Value:='This e-mail and any attachments thereto contain confidential information or information belonging to kasneb and are intended solely for the addressees. The opinions therein, explicit or implied, are solely those of the author and do not'+
        ' necessarily represent those of kasneb as an organisation. kasneb does not accept legal responsibility for the contents of this message or any damage whatsoever that is caused by transmittal of this message'+

        'The unauthorised disclosure, use, dissemination or copying (either whole or partial) of this e-mail, or any information it contains, is prohibited. E-mails are susceptible to alteration and their integrity '+
        'cannot be guaranteed.  kasneb shall not be liable for this e-mail if modified or falsified. If you are not the intended recipient of this e-mail, please delete it immediately from your system and notify the sender of the wrong delivery.'+
        'This e-mail and any attachments thereto contain confidential information or information belonging to kasneb and are intended solely for the addressees. The opinions therein, explicit or implied, are solely those of the author and do not'+
        ' necessarily represent those of kasneb as an organisation. kasneb does not accept legal responsibility for the contents of this message or any damage whatsoever that is caused by transmittal of this message'+

        'The unauthorised disclosure, use, dissemination or copying (either whole or partial) of this e-mail, or any information it contains, is prohibited. E-mails are susceptible to alteration and their integrity '+
        'cannot be guaranteed.  kasneb shall not be liable for this e-mail if modified or falsified. If you are not the intended recipient of this e-mail, please delete it immediately from your system and notify the sender of the wrong delivery.';
        MaxLength:=STRLEN(Value);
        MESSAGE('%1',MaxLength);}
        #2..4
        CLEAR(Body);
        MESSAGE('%1',BodyText);
        */
    //end;
}

