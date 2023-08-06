// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_register_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension ProjectRegisterStatusMatch on ProjectRegisterStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() success,
      required T Function() error}) {
    final v = this;
    if (v == ProjectRegisterStatus.initial) {
      return initial();
    }

    if (v == ProjectRegisterStatus.loading) {
      return loading();
    }

    if (v == ProjectRegisterStatus.success) {
      return success();
    }

    if (v == ProjectRegisterStatus.error) {
      return error();
    }

    throw Exception(
        'ProjectRegisterStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? success,
      T Function()? error}) {
    final v = this;
    if (v == ProjectRegisterStatus.initial && initial != null) {
      return initial();
    }

    if (v == ProjectRegisterStatus.loading && loading != null) {
      return loading();
    }

    if (v == ProjectRegisterStatus.success && success != null) {
      return success();
    }

    if (v == ProjectRegisterStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
