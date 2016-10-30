.class Lcom/android/server/pm/HibernateThread$5;
.super Ljava/lang/Thread;
.source "HibernateThread.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/pm/HibernateThread;->shutdownRadios(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/pm/HibernateThread;

.field final synthetic val$done:[Z

.field final synthetic val$endTime:J


# direct methods
.method constructor <init>(Lcom/android/server/pm/HibernateThread;J[Z)V
    .locals 0

    .prologue
    .line 410
    iput-object p1, p0, Lcom/android/server/pm/HibernateThread$5;->this$0:Lcom/android/server/pm/HibernateThread;

    iput-wide p2, p0, Lcom/android/server/pm/HibernateThread$5;->val$endTime:J

    iput-object p4, p0, Lcom/android/server/pm/HibernateThread$5;->val$done:[Z

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 22

    .prologue
    .line 414
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/pm/HibernateThread$5;->this$0:Lcom/android/server/pm/HibernateThread;

    move-object/from16 v18, v0

    # getter for: Lcom/android/server/pm/HibernateThread;->mContext:Landroid/content/Context;
    invoke-static/range {v18 .. v18}, Lcom/android/server/pm/HibernateThread;->access$200(Lcom/android/server/pm/HibernateThread;)Landroid/content/Context;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v15

    .line 415
    .local v15, "res":Landroid/content/ContentResolver;
    const-string v18, "gps"

    move-object/from16 v0, v18

    invoke-static {v15, v0}, Landroid/provider/Settings$Secure;->isLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;)Z

    move-result v6

    .line 417
    .local v6, "gpsEnabled":Z
    if-eqz v6, :cond_0

    .line 418
    const-string v18, "gps"

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-static {v15, v0, v1}, Landroid/provider/Settings$Secure;->setLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;Z)V

    .line 421
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/pm/HibernateThread$5;->this$0:Lcom/android/server/pm/HibernateThread;

    move-object/from16 v18, v0

    # getter for: Lcom/android/server/pm/HibernateThread;->mContext:Landroid/content/Context;
    invoke-static/range {v18 .. v18}, Lcom/android/server/pm/HibernateThread;->access$200(Lcom/android/server/pm/HibernateThread;)Landroid/content/Context;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v19

    const-string v20, "persist.sys.qbGpsWasOn"

    if-eqz v6, :cond_6

    const/16 v18, 0x1

    :goto_0
    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 423
    const-string v18, "HibernateThread"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "QuickBoot DOWN Start, gpsEnabled="

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 433
    const-string v18, "nfc"

    invoke-static/range {v18 .. v18}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Landroid/nfc/INfcAdapter$Stub;->asInterface(Landroid/os/IBinder;)Landroid/nfc/INfcAdapter;

    move-result-object v10

    .line 436
    .local v10, "nfc":Landroid/nfc/INfcAdapter;
    if-eqz v10, :cond_1

    :try_start_0
    invoke-interface {v10}, Landroid/nfc/INfcAdapter;->getState()I

    move-result v18

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_7

    :cond_1
    const/4 v11, 0x1

    .line 438
    .local v11, "nfcOff":Z
    :goto_1
    if-nez v11, :cond_2

    .line 439
    const-string v18, "HibernateThread"

    const-string v19, "Turning off NFC..."

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 440
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-interface {v10, v0}, Landroid/nfc/INfcAdapter;->disable(Z)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 446
    :cond_2
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/pm/HibernateThread$5;->this$0:Lcom/android/server/pm/HibernateThread;

    move-object/from16 v18, v0

    # getter for: Lcom/android/server/pm/HibernateThread;->mContext:Landroid/content/Context;
    invoke-static/range {v18 .. v18}, Lcom/android/server/pm/HibernateThread;->access$200(Lcom/android/server/pm/HibernateThread;)Landroid/content/Context;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v19

    const-string v20, "persist.sys.quickboot.nfcwason"

    if-eqz v11, :cond_8

    const/16 v18, 0x0

    :goto_3
    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 448
    const-string v18, "HibernateThread"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "QuickBoot DOWN Start, nfcOff="

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 451
    const-string v18, "bluetooth_manager"

    invoke-static/range {v18 .. v18}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Landroid/bluetooth/IBluetoothManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/bluetooth/IBluetoothManager;

    move-result-object v3

    .line 455
    .local v3, "bluetooth":Landroid/bluetooth/IBluetoothManager;
    if-eqz v3, :cond_3

    :try_start_1
    invoke-interface {v3}, Landroid/bluetooth/IBluetoothManager;->isEnabled()Z

    move-result v18

    if-nez v18, :cond_9

    :cond_3
    const/4 v4, 0x1

    .line 456
    .local v4, "bluetoothOff":Z
    :goto_4
    if-nez v4, :cond_4

    .line 457
    const-string v18, "HibernateThread"

    const-string v19, "Disabling Bluetooth..."

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 458
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-interface {v3, v0}, Landroid/bluetooth/IBluetoothManager;->disable(Z)Z
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 466
    :cond_4
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/pm/HibernateThread$5;->this$0:Lcom/android/server/pm/HibernateThread;

    move-object/from16 v18, v0

    # getter for: Lcom/android/server/pm/HibernateThread;->mContext:Landroid/content/Context;
    invoke-static/range {v18 .. v18}, Lcom/android/server/pm/HibernateThread;->access$200(Lcom/android/server/pm/HibernateThread;)Landroid/content/Context;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v19

    const-string v20, "persist.sys.quickboot.btwason"

    if-eqz v4, :cond_a

    const/16 v18, 0x0

    :goto_6
    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 469
    const-string v18, "phone"

    invoke-static/range {v18 .. v18}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v12

    .line 471
    .local v12, "phone":Lcom/android/internal/telephony/ITelephony;
    const/4 v13, 0x0

    .line 473
    .local v13, "radioChannel":I
    const/4 v14, 0x1

    .line 474
    .local v14, "radioOff":Z
    :try_start_2
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/telephony/MSimTelephonyManager;->isMultiSimEnabled()Z

    move-result v18

    if-eqz v18, :cond_c

    .line 475
    const-string v18, "phone_msim"

    invoke-static/range {v18 .. v18}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/android/internal/telephony/msim/ITelephonyMSim$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/msim/ITelephonyMSim;

    move-result-object v9

    .line 478
    .local v9, "mphone":Lcom/android/internal/telephony/msim/ITelephonyMSim;
    if-eqz v9, :cond_e

    .line 479
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_7
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/telephony/MSimTelephonyManager;->getPhoneCount()I

    move-result v18

    move/from16 v0, v18

    if-ge v7, v0, :cond_e

    .line 481
    if-eqz v14, :cond_b

    invoke-interface {v9, v7}, Lcom/android/internal/telephony/msim/ITelephonyMSim;->isRadioOn(I)Z

    move-result v18

    if-nez v18, :cond_b

    const/4 v14, 0x1

    .line 482
    :goto_8
    invoke-interface {v9, v7}, Lcom/android/internal/telephony/msim/ITelephonyMSim;->isRadioOn(I)Z

    move-result v18

    if-eqz v18, :cond_5

    .line 483
    const-string v18, "HibernateThread"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Turning off radio on Subscription :"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-interface {v9, v0, v7}, Lcom/android/internal/telephony/msim/ITelephonyMSim;->setRadio(ZI)Z
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_2

    .line 487
    const/16 v18, 0x1

    shl-int v18, v18, v7

    add-int v13, v13, v18

    .line 480
    :cond_5
    add-int/lit8 v7, v7, 0x1

    goto :goto_7

    .line 421
    .end local v3    # "bluetooth":Landroid/bluetooth/IBluetoothManager;
    .end local v4    # "bluetoothOff":Z
    .end local v7    # "i":I
    .end local v9    # "mphone":Lcom/android/internal/telephony/msim/ITelephonyMSim;
    .end local v10    # "nfc":Landroid/nfc/INfcAdapter;
    .end local v11    # "nfcOff":Z
    .end local v12    # "phone":Lcom/android/internal/telephony/ITelephony;
    .end local v13    # "radioChannel":I
    .end local v14    # "radioOff":Z
    :cond_6
    const/16 v18, 0x0

    goto/16 :goto_0

    .line 436
    .restart local v10    # "nfc":Landroid/nfc/INfcAdapter;
    :cond_7
    const/4 v11, 0x0

    goto/16 :goto_1

    .line 442
    :catch_0
    move-exception v5

    .line 443
    .local v5, "ex":Landroid/os/RemoteException;
    const-string v18, "HibernateThread"

    const-string v19, "RemoteException during NFC shutdown"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 444
    const/4 v11, 0x1

    .restart local v11    # "nfcOff":Z
    goto/16 :goto_2

    .line 446
    .end local v5    # "ex":Landroid/os/RemoteException;
    :cond_8
    const/16 v18, 0x1

    goto/16 :goto_3

    .line 455
    .restart local v3    # "bluetooth":Landroid/bluetooth/IBluetoothManager;
    :cond_9
    const/4 v4, 0x0

    goto/16 :goto_4

    .line 461
    :catch_1
    move-exception v5

    .line 462
    .restart local v5    # "ex":Landroid/os/RemoteException;
    const-string v18, "HibernateThread"

    const-string v19, "RemoteException during bluetooth shutdown"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 463
    const/4 v4, 0x1

    .restart local v4    # "bluetoothOff":Z
    goto/16 :goto_5

    .line 466
    .end local v5    # "ex":Landroid/os/RemoteException;
    :cond_a
    const/16 v18, 0x1

    goto/16 :goto_6

    .line 481
    .restart local v7    # "i":I
    .restart local v9    # "mphone":Lcom/android/internal/telephony/msim/ITelephonyMSim;
    .restart local v12    # "phone":Lcom/android/internal/telephony/ITelephony;
    .restart local v13    # "radioChannel":I
    .restart local v14    # "radioOff":Z
    :cond_b
    const/4 v14, 0x0

    goto :goto_8

    .line 492
    .end local v7    # "i":I
    .end local v9    # "mphone":Lcom/android/internal/telephony/msim/ITelephonyMSim;
    :cond_c
    if-eqz v12, :cond_d

    :try_start_3
    invoke-interface {v12}, Lcom/android/internal/telephony/ITelephony;->isRadioOn()Z

    move-result v18

    if-nez v18, :cond_17

    :cond_d
    const/4 v14, 0x1

    .line 493
    :goto_9
    if-nez v14, :cond_e

    .line 494
    const-string v18, "HibernateThread"

    const-string v19, "Turning off radio..."

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 495
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-interface {v12, v0}, Lcom/android/internal/telephony/ITelephony;->setRadio(Z)Z
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_2

    .line 496
    const/4 v13, 0x1

    .line 504
    :cond_e
    :goto_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/pm/HibernateThread$5;->this$0:Lcom/android/server/pm/HibernateThread;

    move-object/from16 v18, v0

    # getter for: Lcom/android/server/pm/HibernateThread;->mContext:Landroid/content/Context;
    invoke-static/range {v18 .. v18}, Lcom/android/server/pm/HibernateThread;->access$200(Lcom/android/server/pm/HibernateThread;)Landroid/content/Context;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v18

    const-string v19, "persist.sys.quickboot.radiowason"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v1, v13}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 507
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/pm/HibernateThread$5;->this$0:Lcom/android/server/pm/HibernateThread;

    move-object/from16 v18, v0

    # getter for: Lcom/android/server/pm/HibernateThread;->mContext:Landroid/content/Context;
    invoke-static/range {v18 .. v18}, Lcom/android/server/pm/HibernateThread;->access$200(Lcom/android/server/pm/HibernateThread;)Landroid/content/Context;

    move-result-object v18

    const-string v19, "wifi"

    invoke-virtual/range {v18 .. v19}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/net/wifi/WifiManager;

    .line 509
    .local v8, "mWifiManager":Landroid/net/wifi/WifiManager;
    if-eqz v8, :cond_19

    .line 510
    invoke-virtual {v8}, Landroid/net/wifi/WifiManager;->getWifiState()I

    move-result v18

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_18

    const/16 v17, 0x1

    .line 514
    .local v17, "wifiOff":Z
    :goto_b
    if-nez v17, :cond_f

    .line 515
    const-string v18, "HibernateThread"

    const-string v19, "set wifi disabled"

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 516
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v8, v0}, Landroid/net/wifi/WifiManager;->setWifiEnabled(Z)Z

    .line 519
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/pm/HibernateThread$5;->this$0:Lcom/android/server/pm/HibernateThread;

    move-object/from16 v18, v0

    # getter for: Lcom/android/server/pm/HibernateThread;->mContext:Landroid/content/Context;
    invoke-static/range {v18 .. v18}, Lcom/android/server/pm/HibernateThread;->access$200(Lcom/android/server/pm/HibernateThread;)Landroid/content/Context;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v19

    const-string v20, "persist.sys.quickboot.wifiwason"

    if-eqz v17, :cond_1a

    const/16 v18, 0x0

    :goto_c
    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 522
    if-eqz v8, :cond_1c

    .line 523
    invoke-virtual {v8}, Landroid/net/wifi/WifiManager;->getWifiApState()I

    move-result v18

    const/16 v19, 0xb

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_1b

    const/16 v16, 0x1

    .line 527
    .local v16, "wifiApOff":Z
    :goto_d
    if-nez v16, :cond_1d

    .line 528
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/pm/HibernateThread$5;->this$0:Lcom/android/server/pm/HibernateThread;

    move-object/from16 v18, v0

    # getter for: Lcom/android/server/pm/HibernateThread;->DEBUG:Z
    invoke-static/range {v18 .. v18}, Lcom/android/server/pm/HibernateThread;->access$300(Lcom/android/server/pm/HibernateThread;)Z

    move-result v18

    if-eqz v18, :cond_10

    .line 529
    const-string v18, "HibernateThread"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "set wifi ap disabled "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v8}, Landroid/net/wifi/WifiManager;->getWifiApState()I

    move-result v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 533
    :cond_10
    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Landroid/net/wifi/WifiManager;->setWifiApEnabled(Landroid/net/wifi/WifiConfiguration;Z)Z

    .line 539
    :cond_11
    :goto_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/pm/HibernateThread$5;->this$0:Lcom/android/server/pm/HibernateThread;

    move-object/from16 v18, v0

    # getter for: Lcom/android/server/pm/HibernateThread;->mContext:Landroid/content/Context;
    invoke-static/range {v18 .. v18}, Lcom/android/server/pm/HibernateThread;->access$200(Lcom/android/server/pm/HibernateThread;)Landroid/content/Context;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v19

    const-string v20, "persist.sys.quickboot.wifiapwason"

    if-eqz v16, :cond_1e

    const/16 v18, 0x0

    :goto_f
    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 544
    const-string v18, "HibernateThread"

    const-string v19, "Waiting for Bluetooth Radio and Wifi..."

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 546
    :goto_10
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v18

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/server/pm/HibernateThread$5;->val$endTime:J

    move-wide/from16 v20, v0

    cmp-long v18, v18, v20

    if-gez v18, :cond_27

    .line 547
    if-nez v4, :cond_12

    .line 549
    :try_start_4
    invoke-interface {v3}, Landroid/bluetooth/IBluetoothManager;->isEnabled()Z
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_3

    move-result v18

    if-nez v18, :cond_1f

    const/4 v4, 0x1

    .line 556
    :goto_11
    if-eqz v4, :cond_12

    .line 557
    const-string v18, "HibernateThread"

    const-string v19, "Bluetooth turned off."

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 560
    :cond_12
    if-nez v17, :cond_14

    .line 561
    const-string v18, "HibernateThread"

    const-string v19, "wait wifi"

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 562
    if-eqz v8, :cond_13

    invoke-virtual {v8}, Landroid/net/wifi/WifiManager;->getWifiState()I

    move-result v18

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_20

    :cond_13
    const/16 v17, 0x1

    .line 566
    :cond_14
    :goto_12
    if-nez v16, :cond_16

    .line 567
    if-eqz v8, :cond_15

    invoke-virtual {v8}, Landroid/net/wifi/WifiManager;->getWifiApState()I

    move-result v18

    const/16 v19, 0xb

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_21

    :cond_15
    const/16 v16, 0x1

    .line 569
    :goto_13
    if-nez v16, :cond_16

    .line 570
    const-string v18, "HibernateThread"

    const-string v19, "waiting wifi ap disabled"

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 574
    :cond_16
    if-nez v14, :cond_25

    .line 575
    const-string v18, "HibernateThread"

    const-string v19, "wait radio"

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 577
    :try_start_5
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/telephony/MSimTelephonyManager;->isMultiSimEnabled()Z

    move-result v18

    if-eqz v18, :cond_23

    .line 579
    const/4 v14, 0x1

    .line 580
    const-string v18, "phone_msim"

    invoke-static/range {v18 .. v18}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/android/internal/telephony/msim/ITelephonyMSim$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/msim/ITelephonyMSim;

    move-result-object v9

    .line 583
    .restart local v9    # "mphone":Lcom/android/internal/telephony/msim/ITelephonyMSim;
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_14
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/telephony/MSimTelephonyManager;->getPhoneCount()I

    move-result v18

    move/from16 v0, v18

    if-ge v7, v0, :cond_25

    .line 585
    const-string v18, "HibernateThread"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "wait radio channel: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 586
    if-eqz v14, :cond_22

    invoke-interface {v9, v7}, Lcom/android/internal/telephony/msim/ITelephonyMSim;->isRadioOn(I)Z
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_4

    move-result v18

    if-nez v18, :cond_22

    const/4 v14, 0x1

    .line 584
    :goto_15
    add-int/lit8 v7, v7, 0x1

    goto :goto_14

    .line 492
    .end local v7    # "i":I
    .end local v8    # "mWifiManager":Landroid/net/wifi/WifiManager;
    .end local v9    # "mphone":Lcom/android/internal/telephony/msim/ITelephonyMSim;
    .end local v16    # "wifiApOff":Z
    .end local v17    # "wifiOff":Z
    :cond_17
    const/4 v14, 0x0

    goto/16 :goto_9

    .line 499
    :catch_2
    move-exception v5

    .line 500
    .restart local v5    # "ex":Landroid/os/RemoteException;
    const/4 v13, 0x0

    .line 501
    const/4 v14, 0x1

    .line 502
    const-string v18, "HibernateThread"

    const-string v19, "RemoteException during radio shutdown"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_a

    .line 510
    .end local v5    # "ex":Landroid/os/RemoteException;
    .restart local v8    # "mWifiManager":Landroid/net/wifi/WifiManager;
    :cond_18
    const/16 v17, 0x0

    goto/16 :goto_b

    .line 512
    :cond_19
    const/16 v17, 0x1

    .restart local v17    # "wifiOff":Z
    goto/16 :goto_b

    .line 519
    :cond_1a
    const/16 v18, 0x1

    goto/16 :goto_c

    .line 523
    :cond_1b
    const/16 v16, 0x0

    goto/16 :goto_d

    .line 525
    :cond_1c
    const/16 v16, 0x1

    .restart local v16    # "wifiApOff":Z
    goto/16 :goto_d

    .line 535
    :cond_1d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/pm/HibernateThread$5;->this$0:Lcom/android/server/pm/HibernateThread;

    move-object/from16 v18, v0

    # getter for: Lcom/android/server/pm/HibernateThread;->DEBUG:Z
    invoke-static/range {v18 .. v18}, Lcom/android/server/pm/HibernateThread;->access$300(Lcom/android/server/pm/HibernateThread;)Z

    move-result v18

    if-eqz v18, :cond_11

    .line 536
    const-string v18, "HibernateThread"

    const-string v19, "wifi ap is disabled"

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_e

    .line 539
    :cond_1e
    const/16 v18, 0x1

    goto/16 :goto_f

    .line 549
    :cond_1f
    const/4 v4, 0x0

    goto/16 :goto_11

    .line 550
    :catch_3
    move-exception v5

    .line 551
    .restart local v5    # "ex":Landroid/os/RemoteException;
    const-string v18, "HibernateThread"

    const-string v19, "RemoteException during bluetooth shutdown"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 554
    const/4 v4, 0x1

    goto/16 :goto_11

    .line 562
    .end local v5    # "ex":Landroid/os/RemoteException;
    :cond_20
    const/16 v17, 0x0

    goto/16 :goto_12

    .line 567
    :cond_21
    const/16 v16, 0x0

    goto/16 :goto_13

    .line 586
    .restart local v7    # "i":I
    .restart local v9    # "mphone":Lcom/android/internal/telephony/msim/ITelephonyMSim;
    :cond_22
    const/4 v14, 0x0

    goto :goto_15

    .line 589
    .end local v7    # "i":I
    .end local v9    # "mphone":Lcom/android/internal/telephony/msim/ITelephonyMSim;
    :cond_23
    :try_start_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/pm/HibernateThread$5;->this$0:Lcom/android/server/pm/HibernateThread;

    move-object/from16 v18, v0

    # getter for: Lcom/android/server/pm/HibernateThread;->DEBUG:Z
    invoke-static/range {v18 .. v18}, Lcom/android/server/pm/HibernateThread;->access$300(Lcom/android/server/pm/HibernateThread;)Z

    move-result v18

    if-eqz v18, :cond_24

    .line 590
    const-string v18, "HibernateThread"

    const-string v19, "wait radio only one radio."

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 592
    :cond_24
    invoke-interface {v12}, Lcom/android/internal/telephony/ITelephony;->isRadioOn()Z
    :try_end_6
    .catch Landroid/os/RemoteException; {:try_start_6 .. :try_end_6} :catch_4

    move-result v18

    if-nez v18, :cond_28

    const/4 v14, 0x1

    .line 602
    :cond_25
    :goto_16
    if-nez v11, :cond_26

    .line 604
    :try_start_7
    invoke-interface {v10}, Landroid/nfc/INfcAdapter;->getState()I
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_7} :catch_5

    move-result v18

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_29

    const/4 v11, 0x1

    .line 610
    :goto_17
    if-eqz v14, :cond_26

    .line 611
    const-string v18, "HibernateThread"

    const-string v19, "NFC turned off."

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 615
    :cond_26
    if-eqz v14, :cond_2a

    if-eqz v4, :cond_2a

    if-eqz v17, :cond_2a

    if-eqz v16, :cond_2a

    if-eqz v11, :cond_2a

    .line 617
    const-string v18, "HibernateThread"

    const-string v19, "Bluetooth Radio and Wifi nfc shutdown complete."

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 619
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/pm/HibernateThread$5;->val$done:[Z

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const/16 v20, 0x1

    aput-boolean v20, v18, v19

    .line 624
    :cond_27
    return-void

    .line 592
    :cond_28
    const/4 v14, 0x0

    goto :goto_16

    .line 594
    :catch_4
    move-exception v5

    .line 595
    .restart local v5    # "ex":Landroid/os/RemoteException;
    const-string v18, "HibernateThread"

    const-string v19, "RemoteException during radio shutdown"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 597
    const/4 v14, 0x1

    goto :goto_16

    .line 604
    .end local v5    # "ex":Landroid/os/RemoteException;
    :cond_29
    const/4 v11, 0x0

    goto :goto_17

    .line 605
    :catch_5
    move-exception v5

    .line 606
    .restart local v5    # "ex":Landroid/os/RemoteException;
    const-string v18, "HibernateThread"

    const-string v19, "RemoteException during NFC shutdown"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 608
    const/4 v11, 0x1

    goto :goto_17

    .line 622
    .end local v5    # "ex":Landroid/os/RemoteException;
    :cond_2a
    const-wide/16 v18, 0x1f4

    invoke-static/range {v18 .. v19}, Landroid/os/SystemClock;->sleep(J)V

    goto/16 :goto_10
.end method
