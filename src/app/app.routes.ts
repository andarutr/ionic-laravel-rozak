import { Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: '',
    redirectTo: 'login',
    pathMatch: 'full',
  },
  {
    path: 'register',
    loadComponent: () => import('./register/register.page').then( m => m.RegisterPage)
  },
  {
    path: 'login',
    loadComponent: () => import('./login/login.page').then( m => m.LoginPage)
  },
  {
    path: 'home',
    loadComponent: () => import('./home/home.page').then( m => m.HomePage)
  },
  {
    path: 'quiz/bagian/:sesi',
    loadComponent: () => import('./quiz/quiz.page').then( m => {
      return m.QuizPage
    })
  },
  {
    path: 'quiz/hasil',
    loadComponent: () => import('./result/result.page').then( m => m.ResultPage)
  },
  {
    path: 'user/profile',
    loadComponent: () => import('./profile/profile.page').then( m => m.ProfilePage)
  },
  {
    path: 'user/ganti-password',
    loadComponent: () => import('./change-password/change-password.page').then( m => m.ChangePasswordPage)
  },
];
