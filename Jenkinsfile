node {
  stage("List S3 buckets") {
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: '379383999174', usernameVariable: 'AKIAVQVIMNLDD7MYZUUY', passwordVariable: 'l3BiUzmYdHX1COSYi5w1Bh2Ar+AK45HM1WlfImRY']])
    {
        AWS("--region=eu-east-2 rds describe-db-snapshots")
    }
  }
  ws { 
      deleteDir()
    stage ('Deleting snapshot '){
    snapshot()
    }
  }
}

def snapshot(){
sh """ 
      snapshot_mysql=`aws --region eu-west-2 rds describe-db-cluster-snapshots --db-cluster-snapshot-identifier mydbsnapshot2 --query 'DBClusterSnapshots[*].DBClusterSnapshotArn' | tr -d '"[] ' | awk '{ print \$1 }' | awk 'NF'`
"""
}
