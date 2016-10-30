.class Lcom/miui/server/SecurityManagerService$1;
.super Landroid/os/Handler;
.source "SecurityManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/server/SecurityManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/server/SecurityManagerService;


# direct methods
.method constructor <init>(Lcom/miui/server/SecurityManagerService;)V
    .locals 0

    .prologue
    .line 93
    iput-object p1, p0, Lcom/miui/server/SecurityManagerService$1;->this$0:Lcom/miui/server/SecurityManagerService;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 10
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v9, 0x0

    .line 96
    iget v5, p1, Landroid/os/Message;->what:I

    packed-switch v5, :pswitch_data_0

    .line 131
    :goto_0
    return-void

    .line 98
    :pswitch_0
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    .line 99
    .local v3, "pkgName":Ljava/lang/String;
    iget v4, p1, Landroid/os/Message;->arg1:I

    .line 100
    .local v4, "uid":I
    move-object v2, v3

    .line 102
    .local v2, "label":Ljava/lang/CharSequence;
    :try_start_0
    iget-object v5, p0, Lcom/miui/server/SecurityManagerService$1;->this$0:Lcom/miui/server/SecurityManagerService;

    # getter for: Lcom/miui/server/SecurityManagerService;->mContext:Landroid/content/Context;
    invoke-static {v5}, Lcom/miui/server/SecurityManagerService;->access$000(Lcom/miui/server/SecurityManagerService;)Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    iget-object v6, p0, Lcom/miui/server/SecurityManagerService$1;->this$0:Lcom/miui/server/SecurityManagerService;

    # getter for: Lcom/miui/server/SecurityManagerService;->mContext:Landroid/content/Context;
    invoke-static {v6}, Lcom/miui/server/SecurityManagerService;->access$000(Lcom/miui/server/SecurityManagerService;)Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v3, v7}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 106
    :goto_1
    new-instance v5, Landroid/app/AlertDialog$Builder;

    iget-object v6, p0, Lcom/miui/server/SecurityManagerService$1;->this$0:Lcom/miui/server/SecurityManagerService;

    # getter for: Lcom/miui/server/SecurityManagerService;->mContext:Landroid/content/Context;
    invoke-static {v6}, Lcom/miui/server/SecurityManagerService;->access$000(Lcom/miui/server/SecurityManagerService;)Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v6, p0, Lcom/miui/server/SecurityManagerService$1;->this$0:Lcom/miui/server/SecurityManagerService;

    # getter for: Lcom/miui/server/SecurityManagerService;->mContext:Landroid/content/Context;
    invoke-static {v6}, Lcom/miui/server/SecurityManagerService;->access$000(Lcom/miui/server/SecurityManagerService;)Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x11070072

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const v6, 0x11070073

    new-instance v7, Lcom/miui/server/SecurityManagerService$1$2;

    invoke-direct {v7, p0, v4, v3}, Lcom/miui/server/SecurityManagerService$1$2;-><init>(Lcom/miui/server/SecurityManagerService$1;ILjava/lang/String;)V

    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const v6, 0x11070074

    new-instance v7, Lcom/miui/server/SecurityManagerService$1$1;

    invoke-direct {v7, p0, v4, v3}, Lcom/miui/server/SecurityManagerService$1$1;-><init>(Lcom/miui/server/SecurityManagerService$1;ILjava/lang/String;)V

    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 125
    .local v0, "dialog":Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    const/16 v6, 0x7d3

    invoke-virtual {v5, v6}, Landroid/view/Window;->setType(I)V

    .line 126
    invoke-virtual {v0, v9}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 127
    invoke-virtual {v0, v9}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 128
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    goto :goto_0

    .line 103
    .end local v0    # "dialog":Landroid/app/Dialog;
    :catch_0
    move-exception v1

    .line 104
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 96
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
