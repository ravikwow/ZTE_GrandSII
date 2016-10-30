.class Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;
.super Ljava/lang/Thread;
.source "MiuiInitServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/server/MiuiInitServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InitCustEnvironmentTask"
.end annotation


# instance fields
.field private mCustVarinat:Ljava/lang/String;

.field private mObs:Lmiui/os/IMiuiInitObserver;

.field final synthetic this$0:Lcom/miui/server/MiuiInitServer;


# direct methods
.method constructor <init>(Lcom/miui/server/MiuiInitServer;Ljava/lang/String;Lmiui/os/IMiuiInitObserver;)V
    .locals 0
    .param p2, "custVariant"    # Ljava/lang/String;
    .param p3, "obs"    # Lmiui/os/IMiuiInitObserver;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;->this$0:Lcom/miui/server/MiuiInitServer;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 81
    iput-object p2, p0, Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;->mCustVarinat:Ljava/lang/String;

    .line 82
    iput-object p3, p0, Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;->mObs:Lmiui/os/IMiuiInitObserver;

    .line 83
    return-void
.end method

.method private importCustProperties(Ljava/io/File;)V
    .locals 6
    .param p1, "custProp"    # Ljava/io/File;

    .prologue
    .line 154
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 156
    :try_start_0
    new-instance v1, Ljava/io/FileReader;

    invoke-direct {v1, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    .line 157
    .local v1, "fileReader":Ljava/io/FileReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 158
    .local v0, "bufferReader":Ljava/io/BufferedReader;
    const/4 v2, 0x0

    .line 159
    .local v2, "line":Ljava/lang/String;
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 160
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 161
    const-string v4, "#"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 164
    const-string v4, "="

    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 165
    .local v3, "ss":[Ljava/lang/String;
    if-eqz v3, :cond_0

    array-length v4, v3

    const/4 v5, 0x2

    if-ne v4, v5, :cond_0

    .line 168
    const/4 v4, 0x0

    aget-object v4, v3, v4

    const/4 v5, 0x1

    aget-object v5, v3, v5

    invoke-static {v4, v5}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 173
    .end local v0    # "bufferReader":Ljava/io/BufferedReader;
    .end local v1    # "fileReader":Ljava/io/FileReader;
    .end local v2    # "line":Ljava/lang/String;
    .end local v3    # "ss":[Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 176
    :cond_1
    :goto_1
    return-void

    .line 170
    .restart local v0    # "bufferReader":Ljava/io/BufferedReader;
    .restart local v1    # "fileReader":Ljava/io/FileReader;
    .restart local v2    # "line":Ljava/lang/String;
    :cond_2
    invoke-direct {p0}, Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;->pokeSystemProperties()V

    .line 171
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 172
    invoke-virtual {v1}, Ljava/io/FileReader;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1
.end method

.method private initCustEnvironment(Ljava/lang/String;)Z
    .locals 7
    .param p1, "custVariant"    # Ljava/lang/String;

    .prologue
    .line 107
    invoke-static {}, Lmiui/os/Environment;->getMiuiCustomizedDirectory()Ljava/io/File;

    move-result-object v1

    .line 108
    .local v1, "currentLink":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    invoke-static {}, Lmiui/os/Environment;->getMiuiDataDirectory()Ljava/io/File;

    move-result-object v5

    const-string v6, "cust"

    invoke-direct {v2, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 110
    .local v2, "target":Ljava/io/File;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 113
    .end local v2    # "target":Ljava/io/File;
    .local v3, "target":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 114
    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/miui/Shell;->remove(Ljava/lang/String;)Z

    .line 123
    :cond_0
    new-instance v5, Ljava/io/File;

    const-string v6, "cust.prop"

    invoke-direct {v5, v3, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {p0, v5}, Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;->importCustProperties(Ljava/io/File;)V

    .line 126
    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/miui/Shell;->link(Ljava/lang/String;Ljava/lang/String;)Z

    .line 129
    invoke-direct {p0, p1}, Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;->saveCustVariantToFile(Ljava/lang/String;)V

    .line 132
    iget-object v5, p0, Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;->this$0:Lcom/miui/server/MiuiInitServer;

    # getter for: Lcom/miui/server/MiuiInitServer;->mContext:Landroid/content/Context;
    invoke-static {v5}, Lcom/miui/server/MiuiInitServer;->access$200(Lcom/miui/server/MiuiInitServer;)Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "wifi_country_code"

    invoke-static {v5, v6}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 134
    .local v0, "countryCode":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 135
    invoke-static {}, Lmiui/os/Build;->getRegion()Ljava/lang/String;

    move-result-object v0

    .line 136
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 137
    iget-object v5, p0, Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;->this$0:Lcom/miui/server/MiuiInitServer;

    # getter for: Lcom/miui/server/MiuiInitServer;->mContext:Landroid/content/Context;
    invoke-static {v5}, Lcom/miui/server/MiuiInitServer;->access$200(Lcom/miui/server/MiuiInitServer;)Landroid/content/Context;

    move-result-object v5

    const-string v6, "wifi"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/wifi/WifiManager;

    .line 139
    .local v4, "wM":Landroid/net/wifi/WifiManager;
    const/4 v5, 0x1

    invoke-virtual {v4, v0, v5}, Landroid/net/wifi/WifiManager;->setCountryCode(Ljava/lang/String;Z)V

    .line 144
    .end local v4    # "wM":Landroid/net/wifi/WifiManager;
    :cond_1
    invoke-direct {p0}, Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;->installVanwardCustApps()V

    .line 146
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    return v5
.end method

.method private installVanwardCustApps()V
    .locals 0

    .prologue
    .line 150
    invoke-static {}, Lcom/android/server/pm/PreinstallApp;->installVanwardCustApps()V

    .line 151
    return-void
.end method

.method private pokeSystemProperties()V
    .locals 11

    .prologue
    .line 181
    :try_start_0
    invoke-static {}, Landroid/os/ServiceManager;->listServices()[Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 185
    .local v7, "services":[Ljava/lang/String;
    move-object v0, v7

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v6, v0, v3

    .line 186
    .local v6, "service":Ljava/lang/String;
    invoke-static {v6}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v5

    .line 187
    .local v5, "obj":Landroid/os/IBinder;
    if-eqz v5, :cond_0

    .line 188
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 190
    .local v1, "data":Landroid/os/Parcel;
    const v8, 0x5f535052

    const/4 v9, 0x0

    const/4 v10, 0x0

    :try_start_1
    invoke-interface {v5, v8, v1, v9, v10}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 196
    :goto_1
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 185
    .end local v1    # "data":Landroid/os/Parcel;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 182
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "obj":Landroid/os/IBinder;
    .end local v6    # "service":Ljava/lang/String;
    .end local v7    # "services":[Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 199
    :cond_1
    return-void

    .line 192
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v1    # "data":Landroid/os/Parcel;
    .restart local v3    # "i$":I
    .restart local v4    # "len$":I
    .restart local v5    # "obj":Landroid/os/IBinder;
    .restart local v6    # "service":Ljava/lang/String;
    .restart local v7    # "services":[Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 193
    .local v2, "e":Ljava/lang/Exception;
    const-string v8, "MiuiInitServer"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Someone wrote a bad service \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\' that doesn\'t like to be poked: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 191
    .end local v2    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v8

    goto :goto_1
.end method

.method private saveCustVariantToFile(Ljava/lang/String;)V
    .locals 5
    .param p1, "custVariant"    # Ljava/lang/String;

    .prologue
    .line 202
    new-instance v1, Ljava/io/File;

    invoke-static {}, Lmiui/os/Environment;->getMiuiDataDirectory()Ljava/io/File;

    move-result-object v3

    const-string v4, "cust_variant"

    invoke-direct {v1, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 205
    .local v1, "custVariantFile":Ljava/io/File;
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 206
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    .line 208
    :cond_0
    new-instance v2, Ljava/io/FileWriter;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v3}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    .line 209
    .local v2, "fileWriter":Ljava/io/FileWriter;
    new-instance v0, Ljava/io/BufferedWriter;

    invoke-direct {v0, v2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 210
    .local v0, "bufferWriter":Ljava/io/BufferedWriter;
    invoke-virtual {v0, p1}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 211
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V

    .line 212
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 215
    .end local v0    # "bufferWriter":Ljava/io/BufferedWriter;
    .end local v2    # "fileWriter":Ljava/io/FileWriter;
    :goto_0
    return-void

    .line 213
    :catch_0
    move-exception v3

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 87
    iget-object v2, p0, Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;->mCustVarinat:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;->initCustEnvironment(Ljava/lang/String;)Z

    move-result v1

    .line 88
    .local v1, "ret":Z
    iget-object v2, p0, Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;->mObs:Lmiui/os/IMiuiInitObserver;

    if-eqz v2, :cond_0

    .line 90
    :try_start_0
    iget-object v2, p0, Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;->mObs:Lmiui/os/IMiuiInitObserver;

    invoke-interface {v2, v1}, Lmiui/os/IMiuiInitObserver;->initDone(Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;->this$0:Lcom/miui/server/MiuiInitServer;

    const/4 v3, 0x0

    # setter for: Lcom/miui/server/MiuiInitServer;->mDoing:Z
    invoke-static {v2, v3}, Lcom/miui/server/MiuiInitServer;->access$102(Lcom/miui/server/MiuiInitServer;Z)Z

    .line 97
    iget-object v2, p0, Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;->this$0:Lcom/miui/server/MiuiInitServer;

    # getter for: Lcom/miui/server/MiuiInitServer;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/miui/server/MiuiInitServer;->access$200(Lcom/miui/server/MiuiInitServer;)Landroid/content/Context;

    move-result-object v2

    new-instance v3, Landroid/content/Intent;

    const-string v4, "miui.intent.action.MIUI_INIT_COMPLETED"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v4, "miui.os.permisson.INIT_MIUI_ENVIRONMENT"

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 101
    new-instance v0, Landroid/content/Intent;

    const-string v2, "miui.intent.action.MIUI_REGION_CHANGED"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 102
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "region"

    invoke-static {}, Lmiui/os/Build;->getRegion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 103
    iget-object v2, p0, Lcom/miui/server/MiuiInitServer$InitCustEnvironmentTask;->this$0:Lcom/miui/server/MiuiInitServer;

    # getter for: Lcom/miui/server/MiuiInitServer;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/miui/server/MiuiInitServer;->access$200(Lcom/miui/server/MiuiInitServer;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 104
    return-void

    .line 91
    .end local v0    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v2

    goto :goto_0
.end method
