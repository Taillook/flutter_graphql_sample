const String readIssues = r'''
  query ReadIssues() {
    repository(owner: "facebook", name: "react"){
      issues(last: 10){
        nodes {
          id
          title
          url
        }
      }
    }
  }
''';
