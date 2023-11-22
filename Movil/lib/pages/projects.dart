import 'package:building_company/pages/navigator.dart';
import 'package:flutter/material.dart';


class Project {
  final String title;
  final String description;
  final String imageUrl;

  Project({required this.title, required this.description, required this.imageUrl});
}

class ProjectDetailsPage extends StatelessWidget {
  final Project project;

  ProjectDetailsPage({required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigation()
    );
  }
}

class ProjectsPage extends StatelessWidget {
  final List<Project> projects = [
    Project(
      title: 'Project 1',
      description: 'Description for Project 1',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Project(
      title: 'Project 2',
      description: 'Description for Project 2',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Project(
      title: 'Project 3',
      description: 'Description for Project 3',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    // ... Add more projects as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Projects'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(
                projects[index].imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(projects[index].title),
              subtitle: Text(projects[index].description),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProjectDetailsPage(
                      project: projects[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
