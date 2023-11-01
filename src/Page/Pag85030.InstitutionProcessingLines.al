#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85030 "Institution Processing Lines"
{
    Caption = 'Institution Processing Lines';
    PageType = ListPart;
    SourceTable = "Bulk Processing Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Passed; Rec.Passed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Passed field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'ID/Passport No.';
                    ToolTip = 'Specifies the value of the ID/Passport No. field.';
                }
                field("Student No."; Rec."Student No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Student No. field.';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Student Name field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surname field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Birth field.';
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Age field.';
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disabled field.';
                }
                field("NCPWD No."; Rec."NCPWD No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NCPWD No. field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Course ID"; Rec."Course ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination ID';
                    ToolTip = 'Specifies the value of the Examination ID field.';
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination';
                    ToolTip = 'Specifies the value of the Examination field.';
                }
                field("Training Institution Code"; Rec."Training Institution Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Institution Code field.';
                }
                field("Training Institution"; Rec."Training Institution")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Institution field.';
                }
                field("<Highest Academic Code>"; Rec."Highest Academic QCode")
                {
                    ApplicationArea = Basic;
                    Caption = 'Highest Academic Code';
                    ToolTip = 'Specifies the value of the Highest Academic Code field.';
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Highest Academic Qualification field.';
                }
                field("Examination Project Code"; Rec."Examination Project Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Project Code field.';
                }
                field("Examination Project Name"; Rec."Examination Project Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Examination Project Name field.';
                }
                field("Examination Cyce"; Rec."Examination Cyce")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Cyce field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Activities)
            {
                action("Student Picture")
                {
                    ApplicationArea = Basic;
                    Image = User;
                    RunObject = Page "Applicant Picture";
                    RunPageLink = "Student No." = field("Student No.");
                    ToolTip = 'Executes the Student Picture action.';
                    // trigger OnAction()
                    // begin
                    //     CameraAvailable := CameraProvider.IsAvailable;
                    //     if CameraAvailable then
                    //         CameraProvider := CameraProvider.Create;
                    // end;
                }
                action("Mandatory Requirements")
                {
                    ApplicationArea = Basic;
                    Image = Documents;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Examination Mandatory Req";
                    RunPageLink = "Course Id" = field("Course ID");
                    RunPageMode = View;
                    ToolTip = 'Executes the Mandatory Requirements action.';
                }
            }
        }
    }

    var
        // [RunOnClient]
        // [WithEvents]
        // CameraProvider: dotnet CameraProvider;
        CameraAvailable: Boolean;
        DeleteExportEnabled: Boolean;
        OverrideImageQst: label 'The existing picture will be replaced. Do you want to continue?';
        DeleteImageQst: label 'Are you sure you want to delete the picture?';
        SelectPictureTxt: label 'Select a picture to upload';
        MustSpecifyDescriptionErr: label 'You must add a description to the item before you can import a picture.';
        HideActions: Boolean;

    // procedure TakeNewPicture()
    // var
    //     CameraOptions: dotnet CameraOptions;
    // begin
    //     Find;
    //     TestField("ID Number");
    //     TestField("First Name");

    //     if not CameraAvailable then
    //         exit;

    //     CameraOptions := CameraOptions.CameraOptions;
    //     CameraOptions.Quality := 50;
    //     CameraProvider.RequestPictureAsync(CameraOptions);
    // end;


    // procedure ImportFromDevice()
    // var
    //     FileManagement: Codeunit "File Management";
    //     FileName: Text;
    //     ClientFileName: Text;
    // begin
    //     Find;
    //     TestField("ID Number");
    //     if "First Name" = '' then
    //         Error(MustSpecifyDescriptionErr);
    //     /*
    //     IF Image.COUNT > 0 THEN
    //       IF NOT CONFIRM(OverrideImageQst) THEN
    //         ERROR('');
    //         */
    //     ClientFileName := '';
    //     FileName := FileManagement.UploadFile(SelectPictureTxt, ClientFileName);
    //     if FileName = '' then
    //         Error('');

    //     Clear(Image);
    //     Image.ImportFile(FileName, ClientFileName);
    //     if not Insert(true) then
    //         Modify(true);

    //     if FileManagement.DeleteServerFile(FileName) then;

    // end;

    // local procedure SetEditableOnPictureActions()
    // begin
    //     //DeleteExportEnabled := Image.COUNT <> 0;
    // end;

    // procedure IsCameraAvailable(): Boolean
    // begin
    //     exit(CameraProvider.IsAvailable);
    // end;

    // procedure SetHideActions()
    // begin
    //     HideActions := true;
    // end;

    // procedure DeleteItemPicture()
    // begin
    //     TestField("ID Number");

    //     if not Confirm(DeleteImageQst) then
    //         exit;

    //     Clear(Image);
    //     Modify(true);
    // end;

    // trigger Cameraprovider::PictureAvailable(PictureName: Text; PictureFilePath: Text)
    // begin
    // end;
}

#pragma implicitwith restore

