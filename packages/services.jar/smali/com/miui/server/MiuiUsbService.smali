.class public Lcom/miui/server/MiuiUsbService;
.super Lmiui/usb/IMiuiUsbManager$Stub;
.source "MiuiUsbService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/server/MiuiUsbService$UsbDebuggingManager;
    }
.end annotation


# static fields
.field public static final SERVICE_NAME:Ljava/lang/String; = "miui.usb.service"

.field private static final TAG:Ljava/lang/String; = "MiuiUsbService"


# instance fields
.field private final mBootCompletedReceiver:Landroid/content/BroadcastReceiver;

.field private mContext:Landroid/content/Context;

.field private mUsbDebuggingManager:Lcom/miui/server/MiuiUsbService$UsbDebuggingManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 57
    invoke-direct {p0}, Lmiui/usb/IMiuiUsbManager$Stub;-><init>()V

    .line 46
    new-instance v0, Lcom/miui/server/MiuiUsbService$1;

    invoke-direct {v0, p0}, Lcom/miui/server/MiuiUsbService$1;-><init>(Lcom/miui/server/MiuiUsbService;)V

    iput-object v0, p0, Lcom/miui/server/MiuiUsbService;->mBootCompletedReceiver:Landroid/content/BroadcastReceiver;

    .line 58
    iput-object p1, p0, Lcom/miui/server/MiuiUsbService;->mContext:Landroid/content/Context;

    .line 59
    const-string v0, "1"

    const-string v1, "ro.adb.secure"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 60
    new-instance v0, Lcom/miui/server/MiuiUsbService$UsbDebuggingManager;

    invoke-direct {v0, p0, p1}, Lcom/miui/server/MiuiUsbService$UsbDebuggingManager;-><init>(Lcom/miui/server/MiuiUsbService;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/server/MiuiUsbService;->mUsbDebuggingManager:Lcom/miui/server/MiuiUsbService$UsbDebuggingManager;

    .line 63
    :cond_0
    iget-object v0, p0, Lcom/miui/server/MiuiUsbService;->mBootCompletedReceiver:Landroid/content/BroadcastReceiver;

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.BOOT_COMPLETED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 65
    return-void
.end method

.method static synthetic access$000(Lcom/miui/server/MiuiUsbService;)Lcom/miui/server/MiuiUsbService$UsbDebuggingManager;
    .locals 1
    .param p0, "x0"    # Lcom/miui/server/MiuiUsbService;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/miui/server/MiuiUsbService;->mUsbDebuggingManager:Lcom/miui/server/MiuiUsbService$UsbDebuggingManager;

    return-object v0
.end method

.method static synthetic access$100(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 40
    invoke-static {p0, p1}, Lcom/miui/server/MiuiUsbService;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static containsFunction(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .param p0, "functions"    # Ljava/lang/String;
    .param p1, "function"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0x2c

    const/4 v2, 0x0

    .line 68
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 69
    .local v1, "index":I
    if-gez v1, :cond_1

    .line 76
    :cond_0
    :goto_0
    return v2

    .line 71
    :cond_1
    if-lez v1, :cond_2

    add-int/lit8 v3, v1, -0x1

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v4, :cond_0

    .line 73
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int v0, v1, v3

    .line 74
    .local v0, "charAfter":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_3

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v4, :cond_0

    .line 76
    :cond_3
    const/4 v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method public acceptMdbRestore()V
    .locals 3

    .prologue
    .line 81
    iget-object v0, p0, Lcom/miui/server/MiuiUsbService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.MANAGE_USB"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    return-void
.end method

.method public allowUsbDebugging(ZLjava/lang/String;)V
    .locals 3
    .param p1, "alwaysAllow"    # Z
    .param p2, "publicKey"    # Ljava/lang/String;

    .prologue
    .line 91
    iget-object v0, p0, Lcom/miui/server/MiuiUsbService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.MANAGE_USB"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    iget-object v0, p0, Lcom/miui/server/MiuiUsbService;->mUsbDebuggingManager:Lcom/miui/server/MiuiUsbService$UsbDebuggingManager;

    invoke-virtual {v0, p1, p2}, Lcom/miui/server/MiuiUsbService$UsbDebuggingManager;->allowUsbDebugging(ZLjava/lang/String;)V

    .line 93
    return-void
.end method

.method public cancelMdbRestore()V
    .locals 3

    .prologue
    .line 86
    iget-object v0, p0, Lcom/miui/server/MiuiUsbService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.MANAGE_USB"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    return-void
.end method

.method public denyUsbDebugging()V
    .locals 3

    .prologue
    .line 97
    iget-object v0, p0, Lcom/miui/server/MiuiUsbService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.MANAGE_USB"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    iget-object v0, p0, Lcom/miui/server/MiuiUsbService;->mUsbDebuggingManager:Lcom/miui/server/MiuiUsbService$UsbDebuggingManager;

    invoke-virtual {v0}, Lcom/miui/server/MiuiUsbService$UsbDebuggingManager;->denyUsbDebugging()V

    .line 99
    return-void
.end method

.method public dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;)V
    .locals 1
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "pw"    # Ljava/io/PrintWriter;

    .prologue
    .line 102
    iget-object v0, p0, Lcom/miui/server/MiuiUsbService;->mUsbDebuggingManager:Lcom/miui/server/MiuiUsbService$UsbDebuggingManager;

    if-eqz v0, :cond_0

    .line 103
    iget-object v0, p0, Lcom/miui/server/MiuiUsbService;->mUsbDebuggingManager:Lcom/miui/server/MiuiUsbService$UsbDebuggingManager;

    invoke-virtual {v0, p1, p2}, Lcom/miui/server/MiuiUsbService$UsbDebuggingManager;->dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;)V

    .line 105
    :cond_0
    return-void
.end method
