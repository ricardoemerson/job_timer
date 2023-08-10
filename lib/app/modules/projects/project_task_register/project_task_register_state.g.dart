// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_task_register_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension ProjectTaskRegisterStatusMatch on ProjectTaskRegisterStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() success,
      required T Function() error}) {
    final v = this;
    if (v == ProjectTaskRegisterStatus.initial) {
      return initial();
    }

    if (v == ProjectTaskRegisterStatus.loading) {
      return loading();
    }

    if (v == ProjectTaskRegisterStatus.success) {
      return success();
    }

    if (v == ProjectTaskRegisterStatus.error) {
      return error();
    }

    throw Exception(
        'ProjectTaskRegisterStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? success,
      T Function()? error}) {
    final v = this;
    if (v == ProjectTaskRegisterStatus.initial && initial != null) {
      return initial();
    }

    if (v == ProjectTaskRegisterStatus.loading && loading != null) {
      return loading();
    }

    if (v == ProjectTaskRegisterStatus.success && success != null) {
      return success();
    }

    if (v == ProjectTaskRegisterStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
