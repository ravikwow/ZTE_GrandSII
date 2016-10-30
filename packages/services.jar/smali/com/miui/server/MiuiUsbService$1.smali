.class Lcom/miui/server/MiuiUsbService$1;
.super Landroid/content/BroadcastReceiver;
.source "MiuiUsbService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/server/MiuiUsbService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/server/MiuiUsbService;


# direct methods
.method constructor <init>(Lcom/miui/server/MiuiUsbService;)V
    .locals 0

    .prologue
    .line 46
    iput-object p1, p0, Lcom/miui/server/MiuiUsbService$1;->this$0:Lcom/miui/server/MiuiUsbService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/miui/server/MiuiUsbService$1;->this$0:Lcom/miui/server/MiuiUsbService;

    # getter for: Lcom/miui/server/MiuiUsbService;->mUsbDebuggingManager:Lcom/miui/server/MiuiUsbService$UsbDebuggingManager;
    invoke-static {v0}, Lcom/miui/server/MiuiUsbService;->access$000(Lcom/miui/server/MiuiUsbService;)Lcom/miui/server/MiuiUsbService$UsbDebuggingManager;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 50
    iget-object v0, p0, Lcom/miui/server/MiuiUsbService$1;->this$0:Lcom/miui/server/MiuiUsbService;

    # getter for: Lcom/miui/server/MiuiUsbService;->mUsbDebuggingManager:Lcom/miui/server/MiuiUsbService$UsbDebuggingManager;
    invoke-static {v0}, Lcom/miui/server/MiuiUsbService;->access$000(Lcom/miui/server/MiuiUsbService;)Lcom/miui/server/MiuiUsbService$UsbDebuggingManager;

    move-result-object v0

    const-string v1, "persist.sys.usb.config"

    const-string v2, "adb"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "adb"

    # invokes: Lcom/miui/server/MiuiUsbService;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z
    invoke-static {v1, v2}, Lcom/miui/server/MiuiUsbService;->access$100(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/server/MiuiUsbService$UsbDebuggingManager;->setAdbEnabled(Z)V

    .line 54
    :cond_0
    return-void
.end method
