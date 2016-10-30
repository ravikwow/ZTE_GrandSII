.class Lcom/android/server/job/JobStore$ReadJobMapFromDiskRunnable;
.super Ljava/lang/Object;
.source "JobStore.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/job/JobStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReadJobMapFromDiskRunnable"
.end annotation


# instance fields
.field private final jobSet:Landroid/util/ArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArraySet",
            "<",
            "Lcom/android/server/job/controllers/JobStatus;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/android/server/job/JobStore;


# direct methods
.method constructor <init>(Lcom/android/server/job/JobStore;Landroid/util/ArraySet;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/ArraySet",
            "<",
            "Lcom/android/server/job/controllers/JobStatus;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 417
    .local p2, "jobSet":Landroid/util/ArraySet;, "Landroid/util/ArraySet<Lcom/android/server/job/controllers/JobStatus;>;"
    iput-object p1, p0, Lcom/android/server/job/JobStore$ReadJobMapFromDiskRunnable;->this$0:Lcom/android/server/job/JobStore;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 418
    iput-object p2, p0, Lcom/android/server/job/JobStore$ReadJobMapFromDiskRunnable;->jobSet:Landroid/util/ArraySet;

    .line 419
    return-void
.end method

.method private buildBuilderFromXml(Lorg/xmlpull/v1/XmlPullParser;)Landroid/app/job/JobInfo$Builder;
    .locals 6
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 616
    const-string v4, "jobid"

    invoke-interface {p1, v5, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 617
    .local v2, "jobId":I
    const-string v4, "package"

    invoke-interface {p1, v5, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 618
    .local v3, "packageName":Ljava/lang/String;
    const-string v4, "class"

    invoke-interface {p1, v5, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 619
    .local v0, "className":Ljava/lang/String;
    new-instance v1, Landroid/content/ComponentName;

    invoke-direct {v1, v3, v0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 621
    .local v1, "cname":Landroid/content/ComponentName;
    new-instance v4, Landroid/app/job/JobInfo$Builder;

    invoke-direct {v4, v2, v1}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    return-object v4
.end method

.method private buildConstraintsFromXml(Landroid/app/job/JobInfo$Builder;Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 4
    .param p1, "jobBuilder"    # Landroid/app/job/JobInfo$Builder;
    .param p2, "parser"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 625
    const-string v1, "unmetered"

    invoke-interface {p2, v2, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 626
    .local v0, "val":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 627
    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    .line 629
    :cond_0
    const-string v1, "connectivity"

    invoke-interface {p2, v2, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 630
    if-eqz v0, :cond_1

    .line 631
    invoke-virtual {p1, v3}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    .line 633
    :cond_1
    const-string v1, "idle"

    invoke-interface {p2, v2, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 634
    if-eqz v0, :cond_2

    .line 635
    invoke-virtual {p1, v3}, Landroid/app/job/JobInfo$Builder;->setRequiresDeviceIdle(Z)Landroid/app/job/JobInfo$Builder;

    .line 637
    :cond_2
    const-string v1, "charging"

    invoke-interface {p2, v2, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 638
    if-eqz v0, :cond_3

    .line 639
    invoke-virtual {p1, v3}, Landroid/app/job/JobInfo$Builder;->setRequiresCharging(Z)Landroid/app/job/JobInfo$Builder;

    .line 641
    :cond_3
    return-void
.end method

.method private buildExecutionTimesFromXml(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/Pair;
    .locals 24
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            ")",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 666
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    .line 667
    .local v17, "nowWallclock":J
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v15

    .line 669
    .local v15, "nowElapsed":J
    const-wide/16 v3, 0x0

    .line 670
    .local v3, "earliestRunTimeElapsed":J
    const-wide v7, 0x7fffffffffffffffL

    .line 671
    .local v7, "latestRunTimeElapsed":J
    const/16 v20, 0x0

    const-string v21, "deadline"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 672
    .local v19, "val":Ljava/lang/String;
    if-eqz v19, :cond_0

    .line 673
    invoke-static/range {v19 .. v19}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    .line 674
    .local v9, "latestRuntimeWallclock":J
    sub-long v20, v9, v17

    const-wide/16 v22, 0x0

    invoke-static/range {v20 .. v23}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v11

    .line 676
    .local v11, "maxDelayElapsed":J
    add-long v7, v15, v11

    .line 678
    .end local v9    # "latestRuntimeWallclock":J
    .end local v11    # "maxDelayElapsed":J
    :cond_0
    const/16 v20, 0x0

    const-string v21, "delay"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 679
    if-eqz v19, :cond_1

    .line 680
    invoke-static/range {v19 .. v19}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    .line 681
    .local v5, "earliestRuntimeWallclock":J
    sub-long v20, v5, v17

    const-wide/16 v22, 0x0

    invoke-static/range {v20 .. v23}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v13

    .line 683
    .local v13, "minDelayElapsed":J
    add-long v3, v15, v13

    .line 686
    .end local v5    # "earliestRuntimeWallclock":J
    .end local v13    # "minDelayElapsed":J
    :cond_1
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v20

    return-object v20
.end method

.method private maybeBuildBackoffPolicyFromXml(Landroid/app/job/JobInfo$Builder;Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 6
    .param p1, "jobBuilder"    # Landroid/app/job/JobInfo$Builder;
    .param p2, "parser"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    const/4 v5, 0x0

    .line 648
    const-string v4, "initial-backoff"

    invoke-interface {p2, v5, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 649
    .local v3, "val":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 650
    invoke-static {v3}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 651
    .local v1, "initialBackoff":J
    const-string v4, "backoff-policy"

    invoke-interface {p2, v5, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 652
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 653
    .local v0, "backoffPolicy":I
    invoke-virtual {p1, v1, v2, v0}, Landroid/app/job/JobInfo$Builder;->setBackoffCriteria(JI)Landroid/app/job/JobInfo$Builder;

    .line 655
    .end local v0    # "backoffPolicy":I
    .end local v1    # "initialBackoff":J
    :cond_0
    return-void
.end method

.method private readJobMapImpl(Ljava/io/FileInputStream;)Ljava/util/List;
    .locals 12
    .param p1, "fis"    # Ljava/io/FileInputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/FileInputStream;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/android/server/job/controllers/JobStatus;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v7, 0x0

    .line 452
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v3

    .line 453
    .local v3, "parser":Lorg/xmlpull/v1/XmlPullParser;
    invoke-interface {v3, p1, v7}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 455
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    .line 457
    .local v1, "eventType":I
    :goto_0
    if-eq v1, v11, :cond_0

    if-eq v1, v10, :cond_0

    .line 458
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 459
    const-string v8, "JobStore"

    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 461
    :cond_0
    if-ne v1, v10, :cond_1

    .line 463
    const-string v8, "JobStore"

    const-string v9, "No persisted jobs."

    invoke-static {v8, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, v7

    .line 504
    :goto_1
    return-object v2

    .line 468
    :cond_1
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    .line 469
    .local v5, "tagName":Ljava/lang/String;
    const-string v8, "job-info"

    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 470
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 473
    .local v2, "jobs":Ljava/util/List;, "Ljava/util/List<Lcom/android/server/job/controllers/JobStatus;>;"
    const/4 v8, 0x0

    :try_start_0
    const-string v9, "version"

    invoke-interface {v3, v8, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 474
    .local v6, "version":I
    if-eqz v6, :cond_2

    .line 475
    const-string v8, "JobStore"

    const-string v9, "Invalid version number, aborting jobs file read."

    invoke-static {v8, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v2, v7

    .line 476
    goto :goto_1

    .line 478
    .end local v6    # "version":I
    :catch_0
    move-exception v0

    .line 479
    .local v0, "e":Ljava/lang/NumberFormatException;
    const-string v8, "JobStore"

    const-string v9, "Invalid version number, aborting jobs file read."

    invoke-static {v8, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, v7

    .line 480
    goto :goto_1

    .line 482
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .restart local v6    # "version":I
    :cond_2
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 485
    :cond_3
    if-ne v1, v11, :cond_4

    .line 486
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    .line 488
    const-string v7, "job"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 489
    invoke-direct {p0, v3}, Lcom/android/server/job/JobStore$ReadJobMapFromDiskRunnable;->restoreJobFromXml(Lorg/xmlpull/v1/XmlPullParser;)Lcom/android/server/job/controllers/JobStatus;

    move-result-object v4

    .line 490
    .local v4, "persistedJob":Lcom/android/server/job/controllers/JobStatus;
    if-eqz v4, :cond_5

    .line 492
    const-string v7, "JobStore"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Read out "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 494
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 500
    .end local v4    # "persistedJob":Lcom/android/server/job/controllers/JobStatus;
    :cond_4
    :goto_2
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 501
    if-ne v1, v10, :cond_3

    goto :goto_1

    .line 496
    .restart local v4    # "persistedJob":Lcom/android/server/job/controllers/JobStatus;
    :cond_5
    const-string v7, "JobStore"

    const-string v8, "Error reading job from file."

    invoke-static {v7, v8}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .end local v2    # "jobs":Ljava/util/List;, "Ljava/util/List<Lcom/android/server/job/controllers/JobStatus;>;"
    .end local v4    # "persistedJob":Lcom/android/server/job/controllers/JobStatus;
    .end local v6    # "version":I
    :cond_6
    move-object v2, v7

    .line 504
    goto :goto_1
.end method

.method private restoreJobFromXml(Lorg/xmlpull/v1/XmlPullParser;)Lcom/android/server/job/controllers/JobStatus;
    .locals 13
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 519
    :try_start_0
    invoke-direct {p0, p1}, Lcom/android/server/job/JobStore$ReadJobMapFromDiskRunnable;->buildBuilderFromXml(Lorg/xmlpull/v1/XmlPullParser;)Landroid/app/job/JobInfo$Builder;

    move-result-object v10

    .line 520
    .local v10, "jobBuilder":Landroid/app/job/JobInfo$Builder;
    const/4 v0, 0x1

    invoke-virtual {v10, v0}, Landroid/app/job/JobInfo$Builder;->setPersisted(Z)Landroid/app/job/JobInfo$Builder;

    .line 521
    const/4 v0, 0x0

    const-string v1, "uid"

    invoke-interface {p1, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 530
    .local v2, "uid":I
    :cond_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v8

    .line 531
    .local v8, "eventType":I
    const/4 v0, 0x4

    if-eq v8, v0, :cond_0

    .line 533
    const/4 v0, 0x2

    if-ne v8, v0, :cond_1

    const-string v0, "constraints"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 536
    :cond_1
    const/4 v0, 0x0

    .line 611
    .end local v2    # "uid":I
    .end local v8    # "eventType":I
    .end local v10    # "jobBuilder":Landroid/app/job/JobInfo$Builder;
    :goto_0
    return-object v0

    .line 522
    :catch_0
    move-exception v7

    .line 523
    .local v7, "e":Ljava/lang/NumberFormatException;
    const-string v0, "JobStore"

    const-string v1, "Error parsing job\'s required fields, skipping"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 524
    const/4 v0, 0x0

    goto :goto_0

    .line 539
    .end local v7    # "e":Ljava/lang/NumberFormatException;
    .restart local v2    # "uid":I
    .restart local v8    # "eventType":I
    .restart local v10    # "jobBuilder":Landroid/app/job/JobInfo$Builder;
    :cond_2
    :try_start_1
    invoke-direct {p0, v10, p1}, Lcom/android/server/job/JobStore$ReadJobMapFromDiskRunnable;->buildConstraintsFromXml(Landroid/app/job/JobInfo$Builder;Lorg/xmlpull/v1/XmlPullParser;)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 544
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 548
    :cond_3
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v8

    .line 549
    const/4 v0, 0x4

    if-eq v8, v0, :cond_3

    .line 550
    const/4 v0, 0x2

    if-eq v8, v0, :cond_4

    .line 551
    const/4 v0, 0x0

    goto :goto_0

    .line 540
    :catch_1
    move-exception v7

    .line 541
    .restart local v7    # "e":Ljava/lang/NumberFormatException;
    const-string v0, "JobStore"

    const-string v1, "Error reading constraints, skipping."

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 542
    const/4 v0, 0x0

    goto :goto_0

    .line 556
    .end local v7    # "e":Ljava/lang/NumberFormatException;
    :cond_4
    :try_start_2
    invoke-direct {p0, p1}, Lcom/android/server/job/JobStore$ReadJobMapFromDiskRunnable;->buildExecutionTimesFromXml(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/Pair;
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v11

    .line 564
    .local v11, "runtimes":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/Long;>;"
    const-string v0, "periodic"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 566
    const/4 v0, 0x0

    :try_start_3
    const-string v1, "period"

    invoke-interface {p1, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 567
    .local v12, "val":Ljava/lang/String;
    invoke-static {v12}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {v10, v0, v1}, Landroid/app/job/JobInfo$Builder;->setPeriodic(J)Landroid/app/job/JobInfo$Builder;
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_3

    .line 592
    .end local v12    # "val":Ljava/lang/String;
    :cond_5
    :goto_1
    invoke-direct {p0, v10, p1}, Lcom/android/server/job/JobStore$ReadJobMapFromDiskRunnable;->maybeBuildBackoffPolicyFromXml(Landroid/app/job/JobInfo$Builder;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 594
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 598
    :cond_6
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v8

    .line 599
    const/4 v0, 0x4

    if-eq v8, v0, :cond_6

    .line 600
    const/4 v0, 0x2

    if-ne v8, v0, :cond_7

    const-string v0, "extras"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    .line 602
    :cond_7
    const-string v0, "JobStore"

    const-string v1, "Error reading extras, skipping."

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 604
    const/4 v0, 0x0

    goto :goto_0

    .line 557
    .end local v11    # "runtimes":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/Long;>;"
    :catch_2
    move-exception v7

    .line 559
    .restart local v7    # "e":Ljava/lang/NumberFormatException;
    const-string v0, "JobStore"

    const-string v1, "Error parsing execution time parameters, skipping."

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 561
    const/4 v0, 0x0

    goto :goto_0

    .line 568
    .end local v7    # "e":Ljava/lang/NumberFormatException;
    .restart local v11    # "runtimes":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/Long;>;"
    :catch_3
    move-exception v7

    .line 569
    .restart local v7    # "e":Ljava/lang/NumberFormatException;
    const-string v0, "JobStore"

    const-string v1, "Error reading periodic execution criteria, skipping."

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 570
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 572
    .end local v7    # "e":Ljava/lang/NumberFormatException;
    :cond_8
    const-string v0, "one-off"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 574
    :try_start_4
    iget-object v0, v11, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v3, 0x0

    cmp-long v0, v0, v3

    if-eqz v0, :cond_9

    .line 575
    iget-object v0, v11, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    sub-long/2addr v0, v3

    invoke-virtual {v10, v0, v1}, Landroid/app/job/JobInfo$Builder;->setMinimumLatency(J)Landroid/app/job/JobInfo$Builder;

    .line 577
    :cond_9
    iget-object v0, v11, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide v3, 0x7fffffffffffffffL

    cmp-long v0, v0, v3

    if-eqz v0, :cond_5

    .line 578
    iget-object v0, v11, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    sub-long/2addr v0, v3

    invoke-virtual {v10, v0, v1}, Landroid/app/job/JobInfo$Builder;->setOverrideDeadline(J)Landroid/app/job/JobInfo$Builder;
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_4

    goto/16 :goto_1

    .line 581
    :catch_4
    move-exception v7

    .line 582
    .restart local v7    # "e":Ljava/lang/NumberFormatException;
    const-string v0, "JobStore"

    const-string v1, "Error reading job execution criteria, skipping."

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 583
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 587
    .end local v7    # "e":Ljava/lang/NumberFormatException;
    :cond_a
    const-string v0, "JobStore"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid parameter tag, skipping - "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 590
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 607
    :cond_b
    invoke-static {p1}, Landroid/os/PersistableBundle;->restoreFromXml(Lorg/xmlpull/v1/XmlPullParser;)Landroid/os/PersistableBundle;

    move-result-object v9

    .line 608
    .local v9, "extras":Landroid/os/PersistableBundle;
    invoke-virtual {v10, v9}, Landroid/app/job/JobInfo$Builder;->setExtras(Landroid/os/PersistableBundle;)Landroid/app/job/JobInfo$Builder;

    .line 609
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 611
    new-instance v0, Lcom/android/server/job/controllers/JobStatus;

    invoke-virtual {v10}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object v1

    iget-object v3, v11, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    iget-object v5, v11, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-direct/range {v0 .. v6}, Lcom/android/server/job/controllers/JobStatus;-><init>(Landroid/app/job/JobInfo;IJJ)V

    goto/16 :goto_0
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 425
    :try_start_0
    iget-object v4, p0, Lcom/android/server/job/JobStore$ReadJobMapFromDiskRunnable;->this$0:Lcom/android/server/job/JobStore;

    # getter for: Lcom/android/server/job/JobStore;->mJobsFile:Landroid/util/AtomicFile;
    invoke-static {v4}, Lcom/android/server/job/JobStore;->access$100(Lcom/android/server/job/JobStore;)Landroid/util/AtomicFile;

    move-result-object v4

    invoke-virtual {v4}, Landroid/util/AtomicFile;->openRead()Ljava/io/FileInputStream;

    move-result-object v1

    .line 426
    .local v1, "fis":Ljava/io/FileInputStream;
    iget-object v5, p0, Lcom/android/server/job/JobStore$ReadJobMapFromDiskRunnable;->this$0:Lcom/android/server/job/JobStore;

    monitor-enter v5
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 427
    :try_start_1
    invoke-direct {p0, v1}, Lcom/android/server/job/JobStore$ReadJobMapFromDiskRunnable;->readJobMapImpl(Ljava/io/FileInputStream;)Ljava/util/List;

    move-result-object v3

    .line 428
    .local v3, "jobs":Ljava/util/List;, "Ljava/util/List<Lcom/android/server/job/controllers/JobStatus;>;"
    if-eqz v3, :cond_0

    .line 429
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_0

    .line 430
    iget-object v4, p0, Lcom/android/server/job/JobStore$ReadJobMapFromDiskRunnable;->jobSet:Landroid/util/ArraySet;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    .line 429
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 433
    .end local v2    # "i":I
    :cond_0
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 434
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 448
    .end local v1    # "fis":Ljava/io/FileInputStream;
    .end local v3    # "jobs":Ljava/util/List;, "Ljava/util/List<Lcom/android/server/job/controllers/JobStatus;>;"
    :goto_1
    return-void

    .line 433
    .restart local v1    # "fis":Ljava/io/FileInputStream;
    :catchall_0
    move-exception v4

    :try_start_3
    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v4
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 435
    .end local v1    # "fis":Ljava/io/FileInputStream;
    :catch_0
    move-exception v0

    .line 437
    .local v0, "e":Ljava/io/FileNotFoundException;
    const-string v4, "JobStore"

    const-string v5, "Could not find jobs file, probably there was nothing to load."

    invoke-static {v4, v5}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 439
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v0

    .line 441
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    const-string v4, "JobStore"

    const-string v5, "Error parsing xml."

    invoke-static {v4, v5, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 443
    .end local v0    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    :catch_2
    move-exception v0

    .line 445
    .local v0, "e":Ljava/io/IOException;
    const-string v4, "JobStore"

    const-string v5, "Error parsing xml."

    invoke-static {v4, v5, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method
