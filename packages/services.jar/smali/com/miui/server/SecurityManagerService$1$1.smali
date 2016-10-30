.class Lcom/miui/server/SecurityManagerService$1$1;
.super Ljava/lang/Object;
.source "SecurityManagerService.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/server/SecurityManagerService$1;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/server/SecurityManagerService$1;

.field final synthetic val$pkgName:Ljava/lang/String;

.field final synthetic val$uid:I


# direct methods
.method constructor <init>(Lcom/miui/server/SecurityManagerService$1;ILjava/lang/String;)V
    .locals 0

    .prologue
    .line 117
    iput-object p1, p0, Lcom/miui/server/SecurityManagerService$1$1;->this$1:Lcom/miui/server/SecurityManagerService$1;

    iput p2, p0, Lcom/miui/server/SecurityManagerService$1$1;->val$uid:I

    iput-object p3, p0, Lcom/miui/server/SecurityManagerService$1$1;->val$pkgName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 120
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService$1$1;->this$1:Lcom/miui/server/SecurityManagerService$1;

    iget-object v0, v0, Lcom/miui/server/SecurityManagerService$1;->this$0:Lcom/miui/server/SecurityManagerService;

    const/4 v1, 0x0

    # setter for: Lcom/miui/server/SecurityManagerService;->mDialogFlag:Z
    invoke-static {v0, v1}, Lcom/miui/server/SecurityManagerService;->access$102(Lcom/miui/server/SecurityManagerService;Z)Z

    .line 121
    iget-object v0, p0, Lcom/miui/server/SecurityManagerService$1$1;->this$1:Lcom/miui/server/SecurityManagerService$1;

    iget-object v0, v0, Lcom/miui/server/SecurityManagerService$1;->this$0:Lcom/miui/server/SecurityManagerService;

    # getter for: Lcom/miui/server/SecurityManagerService;->mAom:Landroid/app/AppOpsManager;
    invoke-static {v0}, Lcom/miui/server/SecurityManagerService;->access$200(Lcom/miui/server/SecurityManagerService;)Landroid/app/AppOpsManager;

    move-result-object v0

    const/16 v1, 0x32

    iget v2, p0, Lcom/miui/server/SecurityManagerService$1$1;->val$uid:I

    iget-object v3, p0, Lcom/miui/server/SecurityManagerService$1$1;->val$pkgName:Ljava/lang/String;

    const/4 v4, 0x2

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/app/AppOpsManager;->setMode(IILjava/lang/String;I)V

    .line 122
    return-void
.end method
