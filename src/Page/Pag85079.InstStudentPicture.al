#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85079 "Inst.Student Picture"
{
    Caption = 'Customer Picture';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = CardPart;
    SourceTable = "Bulk Processing Lines";

    layout
    {
        area(content)
        {
            field(Image; Rec.Image)
            {
                ApplicationArea = All;
                ShowCaption = false;
                ToolTip = 'Specifies the picture of the customer, for example, a logo.';
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(TakePicture)
            {
                ApplicationArea = All;
                Caption = 'Take';
                Image = Camera;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Activate the camera on the device.';
                Visible = CameraAvailable;

                // trigger OnAction()
                // begin
                //     TakeNewPicture;
                // end;
            }
            action(ImportPicture)
            {
                ApplicationArea = All;
                Caption = 'Import';
                Image = Import;
                ToolTip = 'Import a picture file.';

                trigger OnAction()
                var
                    FileManagement: Codeunit "File Management";
                    FileName: Text;
                    ClientFileName: Text;
                begin
                    Rec.TestField("Student No.");
                    if Rec."First Name" = '' then
                        Error(MustSpecifyNameErr);

                    // if Image.Hasvalue then
                    //   if not Confirm(OverrideImageQst) then
                    //     exit;

                    // FileName := FileManagement.UploadFile(SelectPictureTxt,ClientFileName);
                    // if FileName = '' then
                    //   exit;

                    // Clear(Image);
                    // Image.ImportFile(FileName,ClientFileName);
                    // if not Modify(true) then
                    //   Insert(true);

                    // if FileManagement.DeleteServerFile(FileName) then;
                end;
            }
            action(ExportFile)
            {
                ApplicationArea = All;
                Caption = 'Export';
                Enabled = DeleteExportEnabled;
                Image = Export;
                ToolTip = 'Export the picture to a file.';

                trigger OnAction()
                var
                    DummyPictureEntity: Record "Picture Entity";
                    FileManagement: Codeunit "File Management";
                    ToFile: Text;
                    ExportPath: Text;
                begin
                    Rec.TestField("Student No.");
                    Rec.TestField("First Name");

                    ToFile := DummyPictureEntity.GetDefaultMediaDescription(Rec);
                    // ExportPath := TemporaryPath + "Student No." + Format(Image.MediaId);
                    // Image.ExportFile(ExportPath);

                    // FileManagement.ExportImage(ExportPath,ToFile);
                end;
            }
            action(DeletePicture)
            {
                ApplicationArea = All;
                Caption = 'Delete';
                Enabled = DeleteExportEnabled;
                Image = Delete;
                ToolTip = 'Delete the record.';

                trigger OnAction()
                begin
                    Rec.TestField("Student No.");

                    if not Confirm(DeleteImageQst) then
                        exit;

                    Clear(Rec.Image);
                    Rec.Modify(true);
                end;
            }
        }
    }

    // trigger OnAfterGetCurrRecord()
    // begin
    //     SetEditableOnPictureActions;
    // end;

    // trigger OnOpenPage()
    // begin
    //     CameraAvailable := CameraProvider.IsAvailable;
    //     if CameraAvailable then
    //       CameraProvider := CameraProvider.Create;
    // end;

    var
        // [RunOnClient]
        // [WithEvents]
        // CameraProvider: dotnet CameraProvider;
        CameraAvailable: Boolean;
        OverrideImageQst: label 'The existing picture will be replaced. Do you want to continue?';
        DeleteImageQst: label 'Are you sure you want to delete the picture?';
        SelectPictureTxt: label 'Select a picture to upload';
        DeleteExportEnabled: Boolean;
        MustSpecifyNameErr: label 'You must specify a customer name before you can import a picture.';

    // procedure TakeNewPicture()
    // var
    //     CameraOptions: dotnet CameraOptions;
    // begin
    //     Find;
    //     TestField("Student No.");
    //     TestField("First Name");

    //     if not CameraAvailable then
    //       exit;

    //     CameraOptions := CameraOptions.CameraOptions;
    //     CameraOptions.Quality := 50;
    //     CameraProvider.RequestPictureAsync(CameraOptions);
    // end;

    // local procedure SetEditableOnPictureActions()
    // begin
    //     DeleteExportEnabled := Image.Hasvalue;
    // end;

    // procedure IsCameraAvailable(): Boolean
    // begin
    //     exit(CameraProvider.IsAvailable);
    // end;

    // trigger Cameraprovider::PictureAvailable(PictureName: Text;PictureFilePath: Text)
    // var
    //     File: File;
    //     Instream: InStream;
    // begin
    //     if (PictureName = '') or (PictureFilePath = '') then
    //       exit;

    //     if Image.Hasvalue then
    //       if not Confirm(OverrideImageQst) then begin
    //         if Erase(PictureFilePath) then;
    //         exit;
    //       end;

    //     File.Open(PictureFilePath);
    //     File.CreateInstream(Instream);

    //     Clear(Image);
    //     Image.ImportStream(Instream,PictureName);
    //     if not Modify(true) then
    //       Insert(true);

    //     File.Close;
    //     if Erase(PictureFilePath) then;
    // end;
}

#pragma implicitwith restore

