class ProjectRemover
  def remove_all_ready(project_group)
    projects = project_group.projects
    projects.delete if projects.all?(&:all_ready?)
  end
end
